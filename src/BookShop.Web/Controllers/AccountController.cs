using System.Security.Claims;
using BookShop.Web.Data;
using BookShop.Web.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BookShop.Web.Controllers;

public sealed class AccountController(ShopDbContext db, IPasswordHasher<ShopUser> hasher) : Controller
{
    [HttpGet] public IActionResult Register() => View(new RegisterInput());
    [HttpPost, ValidateAntiForgeryToken]
    public async Task<IActionResult> Register(RegisterInput input)
    {
        if (!ModelState.IsValid) return View(input);
        var username = input.UserName.Trim(); var email = input.Email.Trim().ToLowerInvariant();
        if (await db.Users.AnyAsync(u => u.UserName.ToLower() == username.ToLower() || u.Email == email))
        { ModelState.AddModelError("", "That username or email is already registered."); return View(input); }
        var user = new ShopUser { FullName = input.FullName.Trim(), DateOfBirth = input.DateOfBirth?.ToString("yyyy-MM-dd"), Phone = input.Phone,
            Email = email, State = input.State, City = input.City, PostalCode = input.PostalCode, Address = input.Address, UserName = username };
        user.PasswordHash = hasher.HashPassword(user, input.Password);
        db.Users.Add(user); await db.SaveChangesAsync(); await SignIn(user);
        return RedirectToAction("Index", "Home");
    }
    [HttpGet] public IActionResult Login(string? returnUrl = null) => View(new LoginInput { ReturnUrl = returnUrl });
    [HttpPost, ValidateAntiForgeryToken]
    public async Task<IActionResult> Login(LoginInput input)
    {
        if (!ModelState.IsValid) return View(input);
        var user = await db.Users.FirstOrDefaultAsync(u => u.UserName.ToLower() == input.UserName.ToLower() || u.Email == input.UserName.ToLower());
        if (user is null || !user.IsActive || hasher.VerifyHashedPassword(user, user.PasswordHash, input.Password) == PasswordVerificationResult.Failed)
        { ModelState.AddModelError("", "The username or password is incorrect."); return View(input); }
        await SignIn(user);
        return Url.IsLocalUrl(input.ReturnUrl) ? Redirect(input.ReturnUrl!) : RedirectToAction("Index", "Home");
    }
    [HttpPost, ValidateAntiForgeryToken] public async Task<IActionResult> Logout() { await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme); return RedirectToAction("Index", "Home"); }
    public IActionResult Denied() => View();

    private async Task SignIn(ShopUser user)
    {
        var claims = new List<Claim> { new(ClaimTypes.NameIdentifier, user.Id.ToString()), new(ClaimTypes.Name, user.UserName), new(ClaimTypes.GivenName, user.FullName), new(ClaimTypes.Role, user.Role) };
        await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme)));
    }
}
