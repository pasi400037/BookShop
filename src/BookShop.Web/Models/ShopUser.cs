using System.ComponentModel.DataAnnotations;

namespace BookShop.Web.Models;

public sealed class ShopUser
{
    public int Id { get; set; }
    [Required, MaxLength(120)] public string FullName { get; set; } = "";
    [MaxLength(24)] public string? DateOfBirth { get; set; }
    [MaxLength(30)] public string Phone { get; set; } = "";
    [Required, EmailAddress, MaxLength(254)] public string Email { get; set; } = "";
    [MaxLength(80)] public string State { get; set; } = "";
    [MaxLength(100)] public string City { get; set; } = "";
    [MaxLength(20)] public string PostalCode { get; set; } = "";
    [MaxLength(400)] public string Address { get; set; } = "";
    [Required, MaxLength(60)] public string UserName { get; set; } = "";
    [Required] public string PasswordHash { get; set; } = "";
    [MaxLength(24)] public string Role { get; set; } = "Customer";
    public bool IsActive { get; set; } = true;
    public DateTime CreatedAtUtc { get; set; } = DateTime.UtcNow;
}
