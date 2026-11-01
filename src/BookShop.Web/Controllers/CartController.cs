using System.Security.Claims;
using System.Text.Json;
using BookShop.Web.Data;
using BookShop.Web.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BookShop.Web.Controllers;

public sealed class CartController(ShopDbContext db) : Controller
{
    private const string Key = "BookShop.Cart";
    private List<CartEntry> Cart { get => JsonSerializer.Deserialize<List<CartEntry>>(HttpContext.Session.GetString(Key) ?? "[]") ?? []; set => HttpContext.Session.SetString(Key, JsonSerializer.Serialize(value)); }
    public async Task<IActionResult> Index()
    {
        var cart = Cart; var ids = cart.Select(x => x.BookId).ToArray();
        ViewBag.Entries = cart.ToDictionary(x => x.BookId, x => x.Quantity);
        return View(await db.Books.Where(b => ids.Contains(b.Id) && b.IsActive).ToListAsync());
    }
    [HttpPost, ValidateAntiForgeryToken] public async Task<IActionResult> Add(string id, int quantity = 1)
    {
        var book = await db.Books.FirstOrDefaultAsync(b => b.Id == id && b.IsActive);
        if (book is null || book.Stock <= 0) TempData["Error"] = "This book is currently unavailable.";
        else { var cart = Cart; var item = cart.FindIndex(x => x.BookId == id); var qty = Math.Clamp(quantity, 1, 20);
            if (item < 0) cart.Add(new(id, Math.Min(qty, book.Stock))); else cart[item] = cart[item] with { Quantity = Math.Min(book.Stock, cart[item].Quantity + qty) };
            Cart = cart; TempData["Success"] = "Added to your cart."; }
        var referer = Request.Headers["Referer"].FirstOrDefault();
        return Url.IsLocalUrl(referer) ? Redirect(referer!) : RedirectToAction("Index", "Books");
    }
    [HttpPost, ValidateAntiForgeryToken] public IActionResult Update(string id, int quantity)
    { var cart = Cart; if (quantity < 1) cart.RemoveAll(x => x.BookId == id); else { var i = cart.FindIndex(x => x.BookId == id); if (i >= 0) cart[i] = cart[i] with { Quantity = Math.Clamp(quantity, 1, 20) }; } Cart = cart; return RedirectToAction(nameof(Index)); }
    [Authorize, HttpGet] public async Task<IActionResult> Checkout()
    {
        if (!Cart.Any()) return RedirectToAction(nameof(Index));
        var userId = int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!); var user = await db.Users.FindAsync(userId);
        return View(new CheckoutInput { RecipientName = user?.FullName ?? "", Phone = user?.Phone ?? "", Address = user?.Address ?? "", City = user?.City ?? "", State = user?.State ?? "", PostalCode = user?.PostalCode ?? "" });
    }
    [Authorize, HttpPost, ValidateAntiForgeryToken]
    public async Task<IActionResult> Checkout(CheckoutInput input)
    {
        var cart = Cart; var ids = cart.Select(x => x.BookId).ToArray(); var books = await db.Books.Where(b => ids.Contains(b.Id) && b.IsActive).ToListAsync();
        if (!cart.Any() || books.Count != cart.Count) ModelState.AddModelError("", "Your cart has changed. Review it and try again.");
        foreach (var e in cart) { var b = books.FirstOrDefault(x => x.Id == e.BookId); if (b is not null && (e.Quantity > b.Stock || b.Stock <= 0)) ModelState.AddModelError("", $"Insufficient stock for {b.Title}."); }
        var payuReady = !string.IsNullOrWhiteSpace(Environment.GetEnvironmentVariable("PayU__Key")) && !string.IsNullOrWhiteSpace(Environment.GetEnvironmentVariable("PayU__Salt"));
        if (input.PaymentMethod == "PayU" && !payuReady) ModelState.AddModelError("PaymentMethod", "Online payment is not configured yet. Choose cash on delivery.");
        if (input.PaymentMethod is not ("PayU" or "COD")) ModelState.AddModelError("PaymentMethod", "Choose a supported payment method.");
        if (!ModelState.IsValid) return View(input);
        var order = new ShopOrder { UserId = int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!), RecipientName = input.RecipientName, Phone = input.Phone, ShippingAddress = input.Address, City = input.City, State = input.State, PostalCode = input.PostalCode, PaymentMethod = input.PaymentMethod, PaymentStatus = input.PaymentMethod == "COD" ? "Due on delivery" : "Pending", FulfillmentStatus = "New" };
        foreach (var e in cart) { var b = books.Single(x => x.Id == e.BookId); order.Items.Add(new ShopOrderLine { BookId = b.Id, Title = b.Title, UnitPrice = b.Price, Quantity = e.Quantity }); order.Total += b.Price * e.Quantity; b.Stock -= e.Quantity; }
        db.Orders.Add(order); await db.SaveChangesAsync(); Cart = [];
        if (order.PaymentMethod == "PayU") return RedirectToAction(nameof(PaymentStart), new { id = order.Id });
        return RedirectToAction(nameof(Confirmation), new { id = order.Id });
    }
    [Authorize] public async Task<IActionResult> Confirmation(int id)
    {
        var userId = int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!); var order = await db.Orders.Include(o => o.Items).FirstOrDefaultAsync(o => o.Id == id && (o.UserId == userId || User.IsInRole("Admin")));
        return order is null ? NotFound() : View(order);
    }
    [Authorize] public async Task<IActionResult> PaymentStart(int id)
    {
        var order = await OwnedOrder(id); if (order is null) return NotFound();
        var key = Environment.GetEnvironmentVariable("PayU__Key"); var salt = Environment.GetEnvironmentVariable("PayU__Salt");
        if (string.IsNullOrWhiteSpace(key) || string.IsNullOrWhiteSpace(salt)) return RedirectToAction(nameof(Confirmation), new { id });
        var baseUrl = Environment.GetEnvironmentVariable("PayU__PublicBaseUrl") ?? $"{Request.Scheme}://{Request.Host}";
        var data = new PayUService(key, salt, bool.TryParse(Environment.GetEnvironmentVariable("PayU__IsProduction"), out var prod) && prod).Build(order, User.Identity!.Name!, baseUrl);
        return View("PayUPost", data);
    }
    [HttpPost("/cart/payu-return"), IgnoreAntiforgeryToken] public async Task<IActionResult> PayUReturn()
    {
        var form = await Request.ReadFormAsync(); var idRaw = form["udf1"].ToString();
        if (!int.TryParse(idRaw, out var id)) return BadRequest("Invalid order reference.");
        var order = await db.Orders.Include(o => o.Items).FirstOrDefaultAsync(o => o.Id == id); if (order is null) return NotFound();
        var key = Environment.GetEnvironmentVariable("PayU__Key"); var salt = Environment.GetEnvironmentVariable("PayU__Salt");
        if (string.IsNullOrWhiteSpace(key) || string.IsNullOrWhiteSpace(salt)) return BadRequest("Payment is not configured.");
        if (!new PayUService(key, salt, false).Verify(form, order)) { order.PaymentStatus = "Verification failed"; await db.SaveChangesAsync(); return View("PaymentResult", order); }
        order.PayUTransactionId = form["mihpayid"].ToString(); order.PaymentReference = form["txnid"].ToString();
        order.PaymentStatus = string.Equals(form["status"], "success", StringComparison.OrdinalIgnoreCase) ? "Paid" : "Failed";
        await db.SaveChangesAsync(); return View("PaymentResult", order);
    }
    private Task<ShopOrder?> OwnedOrder(int id)
    { var userId = int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!); return db.Orders.Include(o => o.Items).FirstOrDefaultAsync(o => o.Id == id && (o.UserId == userId || User.IsInRole("Admin"))); }
}
