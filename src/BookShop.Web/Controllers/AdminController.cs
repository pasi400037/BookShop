using BookShop.Web.Data;
using BookShop.Web.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Cryptography;

namespace BookShop.Web.Controllers;

[Authorize(Policy = "Admin"), Route("admin")]
public sealed class AdminController(ShopDbContext db, IWebHostEnvironment environment, IPasswordHasher<ShopUser> hasher) : Controller
{
    [HttpGet("")] public async Task<IActionResult> Index()
    { ViewBag.BookCount = await db.Books.CountAsync(); ViewBag.UserCount = await db.Users.CountAsync(u => u.Role == "Customer"); ViewBag.OrderCount = await db.Orders.CountAsync(); return View(await db.Orders.Include(o => o.User).OrderByDescending(o => o.CreatedAtUtc).Take(10).ToListAsync()); }
    [HttpGet("books")] public async Task<IActionResult> Books() => View(await db.Books.OrderBy(b => b.Title).ToListAsync());
    [HttpGet("books/new")] public IActionResult NewBook() => View("EditBook", new BookInput());
    [HttpGet("books/{id}/edit")] public async Task<IActionResult> EditBook(string id) { var b = await db.Books.FindAsync(id); return b is null ? NotFound() : View(new BookInput { Id=b.Id, Title=b.Title, Author=b.Author, Category=b.Category, Publisher=b.Publisher, Language=b.Language, Edition=b.Edition, Genres=b.Genres, Description=b.Description, Price=b.Price, ListPrice=b.ListPrice, Stock=b.Stock, IsActive=b.IsActive }); }
    [HttpPost("books/save"), ValidateAntiForgeryToken]
    public async Task<IActionResult> SaveBook(BookInput input)
    {
        if (input.Image is { Length: > 0 } && (input.Image.Length > 5_000_000 || !new[] { "image/jpeg", "image/png", "image/webp", "image/gif" }.Contains(input.Image.ContentType))) ModelState.AddModelError(nameof(input.Image), "Use a JPG, PNG, WEBP or GIF under 5 MB.");
        if (!ModelState.IsValid) return View("EditBook", input);
        var book = string.IsNullOrWhiteSpace(input.Id) ? new ShopBook() : await db.Books.FindAsync(input.Id) ?? new ShopBook();
        book.Title=input.Title; book.Author=input.Author; book.Category=input.Category; book.Publisher=input.Publisher; book.Language=input.Language; book.Edition=input.Edition; book.Genres=input.Genres; book.Description=input.Description; book.Price=input.Price; book.ListPrice=input.ListPrice; book.Stock=input.Stock; book.IsActive=input.IsActive;
        if (input.Image is { Length: > 0 }) { var dir=Environment.GetEnvironmentVariable("BOOKSHOP_UPLOADS_DIR") ?? Path.Combine(environment.ContentRootPath,"data","uploads"); Directory.CreateDirectory(dir); var ext=Path.GetExtension(Path.GetFileName(input.Image.FileName)).ToLowerInvariant(); var name=Guid.NewGuid().ToString("N")+ext; await using var stream=System.IO.File.Create(Path.Combine(dir,name)); await input.Image.CopyToAsync(stream); book.ImagePath="/uploads/"+name; }
        if (string.IsNullOrWhiteSpace(input.Id)) db.Books.Add(book); await db.SaveChangesAsync(); return RedirectToAction(nameof(Books));
    }
    [HttpPost("books/{id}/delete"), ValidateAntiForgeryToken] public async Task<IActionResult> DeleteBook(string id) { var b=await db.Books.FindAsync(id); if(b is not null){ b.IsActive=false; await db.SaveChangesAsync(); } return RedirectToAction(nameof(Books)); }
    [HttpGet("users")] public async Task<IActionResult> Users() => View(await db.Users.OrderBy(u => u.FullName).ToListAsync());
    [HttpPost("users/{id}/toggle"), ValidateAntiForgeryToken] public async Task<IActionResult> ToggleUser(int id) { var u=await db.Users.FindAsync(id); if(u is not null && u.Id.ToString()!=User.FindFirst(System.Security.Claims.ClaimTypes.NameIdentifier)?.Value && !(u.Role=="Admin" && await db.Users.CountAsync(x=>x.Role=="Admin"&&x.IsActive)<=1)){u.IsActive=!u.IsActive;await db.SaveChangesAsync();} return RedirectToAction(nameof(Users)); }
    [HttpPost("users/{id}/delete"), ValidateAntiForgeryToken] public async Task<IActionResult> DeleteUser(int id) { var u=await db.Users.FindAsync(id); if(u is not null && u.Id.ToString()!=User.FindFirst(System.Security.Claims.ClaimTypes.NameIdentifier)?.Value && !(u.Role=="Admin" && await db.Users.CountAsync(x=>x.Role=="Admin")<=1)){u.IsActive=false;await db.SaveChangesAsync();} return RedirectToAction(nameof(Users)); }
    [HttpGet("orders")] public async Task<IActionResult> Orders() => View(await db.Orders.Include(o=>o.User).OrderByDescending(o=>o.CreatedAtUtc).ToListAsync());
    [HttpPost("orders/{id}/status"), ValidateAntiForgeryToken] public async Task<IActionResult> SetStatus(int id,string status) { if(new[]{"New","Processing","Shipped","Completed","Cancelled"}.Contains(status)){var o=await db.Orders.FindAsync(id);if(o is not null){o.FulfillmentStatus=status;await db.SaveChangesAsync();}} return RedirectToAction(nameof(Orders)); }
    [HttpGet("setup")] [AllowAnonymous] public async Task<IActionResult> Setup() { if(await db.Users.AnyAsync(u=>u.Role=="Admin") || string.IsNullOrWhiteSpace(Environment.GetEnvironmentVariable("BOOKSHOP_SETUP_KEY"))) return NotFound(); return View(); }
    [HttpPost("setup"), AllowAnonymous, ValidateAntiForgeryToken]
    public async Task<IActionResult> Setup(string setupKey,string fullName,string userName,string email,string password)
    { if(await db.Users.AnyAsync(u=>u.Role=="Admin") || string.IsNullOrWhiteSpace(Environment.GetEnvironmentVariable("BOOKSHOP_SETUP_KEY"))) return NotFound(); var expected=Environment.GetEnvironmentVariable("BOOKSHOP_SETUP_KEY")!; var actualBytes=System.Text.Encoding.UTF8.GetBytes(setupKey??""); var expectedBytes=System.Text.Encoding.UTF8.GetBytes(expected); if(actualBytes.Length!=expectedBytes.Length || !CryptographicOperations.FixedTimeEquals(actualBytes,expectedBytes)) { ModelState.AddModelError("","Invalid setup key."); return View(); } bool validEmail; try { validEmail=new System.Net.Mail.MailAddress(email).Address.Equals(email,StringComparison.OrdinalIgnoreCase); } catch { validEmail=false; } if(string.IsNullOrWhiteSpace(fullName)||string.IsNullOrWhiteSpace(userName)||!validEmail||password.Length<12){ModelState.AddModelError("","Enter a name, username, valid email and a password of at least 12 characters.");return View();} var u=new ShopUser{FullName=fullName,UserName=userName,Email=email.ToLowerInvariant(),Role="Admin"};u.PasswordHash=hasher.HashPassword(u,password);db.Users.Add(u);await db.SaveChangesAsync();return RedirectToAction(nameof(Index)); }
}
