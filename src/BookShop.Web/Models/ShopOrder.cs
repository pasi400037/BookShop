using System.ComponentModel.DataAnnotations;

namespace BookShop.Web.Models;

public sealed class ShopOrder
{
    public int Id { get; set; }
    [Required, MaxLength(32)] public string Number { get; set; } = Guid.NewGuid().ToString("N")[..12].ToUpperInvariant();
    public int UserId { get; set; }
    public ShopUser? User { get; set; }
    [Required, MaxLength(40)] public string PaymentStatus { get; set; } = "Pending";
    [Required, MaxLength(40)] public string FulfillmentStatus { get; set; } = "Pending";
    [Required, MaxLength(24)] public string PaymentMethod { get; set; } = "PayU";
    [MaxLength(40)] public string? PayUTransactionId { get; set; }
    [MaxLength(80)] public string? PaymentReference { get; set; }
    [Required, MaxLength(120)] public string RecipientName { get; set; } = "";
    [Required, MaxLength(30)] public string Phone { get; set; } = "";
    [Required, MaxLength(400)] public string ShippingAddress { get; set; } = "";
    [Required, MaxLength(100)] public string City { get; set; } = "";
    [MaxLength(80)] public string State { get; set; } = "";
    [MaxLength(20)] public string PostalCode { get; set; } = "";
    public decimal Total { get; set; }
    public DateTime CreatedAtUtc { get; set; } = DateTime.UtcNow;
    public List<ShopOrderLine> Items { get; set; } = [];
}

public sealed class ShopOrderLine
{
    public int Id { get; set; }
    public int ShopOrderId { get; set; }
    public ShopOrder? Order { get; set; }
    [MaxLength(32)] public string? BookId { get; set; }
    [Required, MaxLength(180)] public string Title { get; set; } = "";
    public decimal UnitPrice { get; set; }
    public int Quantity { get; set; }
}
