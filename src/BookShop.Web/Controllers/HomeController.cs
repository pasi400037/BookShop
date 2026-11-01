using BookShop.Web.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BookShop.Web.Controllers;

public sealed class HomeController(ShopDbContext db) : Controller
{
    public async Task<IActionResult> Index() => View(await db.Books.Where(b => b.IsActive).OrderByDescending(b => b.CreatedAtUtc).Take(8).ToListAsync());
    public IActionResult Error() => View();
}

public sealed class BooksController(ShopDbContext db) : Controller
{
    public async Task<IActionResult> Index(string? category, string? q)
    {
        var books = db.Books.Where(b => b.IsActive);
        if (!string.IsNullOrWhiteSpace(category)) books = books.Where(b => b.Category == category);
        if (!string.IsNullOrWhiteSpace(q)) books = books.Where(b => b.Title.Contains(q) || b.Author.Contains(q) || b.Description.Contains(q));
        ViewBag.Category = category; ViewBag.Query = q;
        ViewBag.Categories = await db.Books.Where(b => b.IsActive).Select(b => b.Category).Distinct().OrderBy(c => c).ToListAsync();
        return View(await books.OrderBy(b => b.Title).ToListAsync());
    }
    public async Task<IActionResult> Details(string id)
    {
        var book = await db.Books.FirstOrDefaultAsync(b => b.Id == id && b.IsActive);
        return book is null ? NotFound() : View(book);
    }
}
