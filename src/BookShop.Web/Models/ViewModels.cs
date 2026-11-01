using System.ComponentModel.DataAnnotations;

namespace BookShop.Web.Models;

public sealed class RegisterInput
{
    [Required, StringLength(120)] public string FullName { get; set; } = "";
    [DataType(DataType.Date)] public DateTime? DateOfBirth { get; set; }
    [Phone, StringLength(30)] public string Phone { get; set; } = "";
    [Required, EmailAddress, StringLength(254)] public string Email { get; set; } = "";
    [StringLength(80)] public string State { get; set; } = "";
    [StringLength(100)] public string City { get; set; } = "";
    [StringLength(20)] public string PostalCode { get; set; } = "";
    [StringLength(400)] public string Address { get; set; } = "";
    [Required, StringLength(60, MinimumLength = 3)] public string UserName { get; set; } = "";
    [Required, StringLength(100, MinimumLength = 8), DataType(DataType.Password)] public string Password { get; set; } = "";
}

public sealed class LoginInput
{
    [Required] public string UserName { get; set; } = "";
    [Required, DataType(DataType.Password)] public string Password { get; set; } = "";
    public string? ReturnUrl { get; set; }
}

public sealed class CheckoutInput
{
    [Required, StringLength(120)] public string RecipientName { get; set; } = "";
    [Required, Phone, StringLength(30)] public string Phone { get; set; } = "";
    [Required, StringLength(400)] public string Address { get; set; } = "";
    [Required, StringLength(100)] public string City { get; set; } = "";
    [StringLength(80)] public string State { get; set; } = "";
    [StringLength(20)] public string PostalCode { get; set; } = "";
    [Required] public string PaymentMethod { get; set; } = "PayU";
}

public sealed class BookInput
{
    public string? Id { get; set; }
    [Required, StringLength(180)] public string Title { get; set; } = "";
    [Required, StringLength(120)] public string Author { get; set; } = "";
    [Required, StringLength(80)] public string Category { get; set; } = "";
    [StringLength(120)] public string Publisher { get; set; } = "";
    [StringLength(80)] public string Language { get; set; } = "English";
    [StringLength(40)] public string Edition { get; set; } = "1st Edition";
    [StringLength(120)] public string Genres { get; set; } = "";
    [StringLength(2000)] public string Description { get; set; } = "";
    [Range(0.01, 1000000)] public decimal Price { get; set; }
    [Range(0.01, 1000000)] public decimal ListPrice { get; set; }
    [Range(0, 100000)] public int Stock { get; set; }
    public bool IsActive { get; set; } = true;
    public IFormFile? Image { get; set; }
}

public sealed record CartEntry(string BookId, int Quantity);
