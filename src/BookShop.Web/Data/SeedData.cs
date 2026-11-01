using BookShop.Web.Models;
using Microsoft.EntityFrameworkCore;

namespace BookShop.Web.Data;

public static class SeedData
{
    public static async Task InitializeAsync(ShopDbContext db)
    {
        if (await db.Books.AnyAsync()) return;
        db.Books.AddRange(
            Book("9780307718341", "Provence, 1970", "Luke Barr", "Biography", 349, 499, 18, "9780307718341_small_14aa84f27.jpg", "M. F. K. Fisher, Julia Child, James Beard, and the reinvention of American taste."),
            Book("9780679755357", "Chez Panisse Cooking", "Paul Bertolli and Alice Waters", "Cooking", 299, 399, 15, "9780679755357_small_ecbf6705e.jpg", "Recipes, menus and stories from the celebrated Chez Panisse kitchen."),
            Book("9781401324780", "Jamie Oliver's Great Britain", "Jamie Oliver", "Cooking", 399, 549, 12, "9781401324780_small_ff4f77208.jpg", "130 of Jamie Oliver's favourite British recipes."),
            Book("BIO-001", "Fundamentals and Techniques of Biophysics and Molecular Biology", "Various Authors", "Academic", 850, 999, 7, "Fundamentals and Techniques of Biophysics and Molecular Biology 2nd Edition.jpeg", "A reference text for students studying biophysics and molecular biology."),
            Book("COM-001", "Marvel Encyclopedia", "DK Publishing", "Comics", 1250, 1599, 9, "Marvel Encyclopedia.jpeg", "An illustrated guide to heroes, teams, and stories from the Marvel universe."),
            Book("GEN-001", "The Book Lover's Companion", "BookShop Editors", "General", 275, 350, 20, "books.png", "A welcome addition to any bookshelf."),
            Book("GEN-002", "Mystery Fiction Collection", "Various Authors", "Action", 325, 425, 11, "horrar.jpg", "A selection of mystery and suspense reading."));
        await db.SaveChangesAsync();
    }

    private static ShopBook Book(string id, string title, string author, string category, decimal price, decimal listPrice, int stock, string image, string description) => new()
    {
        Id = id, Title = title, Author = author, Category = category, Price = price, ListPrice = listPrice,
        Stock = stock, ImagePath = "/images/books/" + Uri.EscapeDataString(image), Publisher = "BookShop Editions",
        Language = "English", Edition = "1st Edition", Genres = category, Description = description
    };
}
