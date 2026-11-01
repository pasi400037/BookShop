using System.Globalization;
using System.Security.Cryptography;
using System.Text;
using Microsoft.AspNetCore.Http;
using BookShop.Web.Models;

namespace BookShop.Web;

public sealed class PayUService(string key, string salt, bool production)
{
    public string Endpoint => production ? "https://secure.payu.in/_payment" : "https://test.payu.in/_payment";
    public Dictionary<string, string> Build(ShopOrder order, string email, string baseUrl)
    {
        var amount = order.Total.ToString("0.00", CultureInfo.InvariantCulture); var product = $"BookShop order {order.Number}"; var name = order.RecipientName;
        var txn = order.Number;
        var raw = $"{key}|{txn}|{amount}|{product}|{name}|{email}|{order.Id}||||||{salt}";
        return new() { ["action"] = Endpoint, ["key"] = key, ["txnid"] = txn, ["amount"] = amount, ["productinfo"] = product, ["firstname"] = name, ["email"] = email, ["phone"] = order.Phone, ["udf1"] = order.Id.ToString(), ["surl"] = baseUrl.TrimEnd('/') + "/cart/payu-return", ["furl"] = baseUrl.TrimEnd('/') + "/cart/payu-return", ["hash"] = Hash(raw) };
    }
    public bool Verify(IFormCollection form, ShopOrder order)
    {
        var status = form["status"].ToString(); var txnid = form["txnid"].ToString(); var amount = form["amount"].ToString();
        if (string.IsNullOrWhiteSpace(form["hash"]) || txnid != order.Number || form["udf1"] != order.Id.ToString() ||
            !decimal.TryParse(amount, CultureInfo.InvariantCulture, out var parsed) || parsed != order.Total) return false;
        var fields = new[] { form["udf5"].ToString(), form["udf4"].ToString(), form["udf3"].ToString(), form["udf2"].ToString(), form["udf1"].ToString(), form["email"].ToString(), form["firstname"].ToString(), form["productinfo"].ToString(), amount, txnid, key };
        var reverse = salt + "|" + status + "|" + form["additionalCharges"] + "|||||" + string.Join("|", fields);
        var expected = Convert.FromHexString(Hash(reverse));
        try { return CryptographicOperations.FixedTimeEquals(expected, Convert.FromHexString(form["hash"].ToString())); } catch (FormatException) { return false; }
    }
    private static string Hash(string value) => Convert.ToHexString(SHA512.HashData(Encoding.UTF8.GetBytes(value))).ToLowerInvariant();
}
