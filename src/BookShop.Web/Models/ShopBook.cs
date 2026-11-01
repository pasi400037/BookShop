using System.ComponentModel.DataAnnotations;

namespace BookShop.Web.Models;

public sealed class ShopBook
{
    [Key, MaxLength(32)] public string Id { get; set; } = Guid.NewGuid().ToString("N");
    [Required, MaxLength(180)] public string Title { get; set; } = "";
    [Required, MaxLength(120)] public string Author { get; set; } = "";
    [Required, MaxLength(80)] public string Category { get; set; } = "General";
    [MaxLength(120)] public string Publisher { get; set; } = "";
    [MaxLength(80)] public string Language { get; set; } = "English";
    [MaxLength(40)] public string Edition { get; set; } = "1st";
    [MaxLength(120)] public string Genres { get; set; } = "";
    [MaxLength(2000)] public string Description { get; set; } = "";
    [Required, MaxLength(240)] public string ImagePath { get; set; } = "/images/books/books.png";
    [Range(0.01, 1000000)] public decimal Price { get; set; }
    [Range(0.01, 1000000)] public decimal ListPrice { get; set; }
    [Range(0, 100000)] public int Stock { get; set; }
    public bool IsActive { get; set; } = true;
    public DateTime CreatedAtUtc { get; set; } = DateTime.UtcNow;
}
