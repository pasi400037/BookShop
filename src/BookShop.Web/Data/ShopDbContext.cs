using BookShop.Web.Models;
using Microsoft.EntityFrameworkCore;

namespace BookShop.Web.Data;

public sealed class ShopDbContext(DbContextOptions<ShopDbContext> options) : DbContext(options)
{
    public DbSet<ShopBook> Books => Set<ShopBook>();
    public DbSet<ShopUser> Users => Set<ShopUser>();
    public DbSet<ShopOrder> Orders => Set<ShopOrder>();
    public DbSet<ShopOrderLine> OrderLines => Set<ShopOrderLine>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<ShopUser>().HasIndex(x => x.UserName).IsUnique();
        modelBuilder.Entity<ShopUser>().HasIndex(x => x.Email).IsUnique();
        modelBuilder.Entity<ShopBook>().Property(x => x.Price).HasPrecision(10, 2);
        modelBuilder.Entity<ShopBook>().Property(x => x.ListPrice).HasPrecision(10, 2);
        modelBuilder.Entity<ShopOrder>().Property(x => x.Total).HasPrecision(10, 2);
        modelBuilder.Entity<ShopOrderLine>().Property(x => x.UnitPrice).HasPrecision(10, 2);
        modelBuilder.Entity<ShopOrder>().HasIndex(x => x.Number).IsUnique();
        modelBuilder.Entity<ShopOrder>().HasMany(x => x.Items).WithOne(x => x.Order).HasForeignKey(x => x.ShopOrderId).OnDelete(DeleteBehavior.Cascade);
    }
}
