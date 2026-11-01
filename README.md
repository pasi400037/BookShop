# LapCare BookShop

A rebuilt, responsive bookshop based on the supplied BookShop site. The original ASP.NET Web Forms source is kept in `BookShop/` for reference. The runnable replacement is `src/BookShop.Web/`, built with ASP.NET Core MVC on .NET 10 and SQLite.

## What works

- Home page, searchable book catalog, category filters and book detail pages.
- Customer registration and sign-in with hashed passwords, plus saved profile and delivery details.
- Guest shopping cart, quantity updates, checkout and saved orders.
- Cash on delivery checkout without a payment account.
- Optional PayU checkout when merchant credentials are configured. The callback hash, order reference and amount are checked before an order is marked paid.
- One-time protected administrator setup; book create/edit/hide, book cover upload, customer enable/disable and order fulfillment updates.
- Original book cover images are included under the new app's static assets.
- Persistent SQLite database and upload folder when run using the included container configuration.

The source archive contained no SQL backup or schema/data export. It also contained only PayU test credentials and localhost callback addresses, so customer accounts, inventory records and payment credentials could not be transferred. The replacement seeds a small starter catalog from the available covers; enter the actual inventory through the admin page.

## Run locally

Install the .NET 10 SDK, then from the repository root:

```sh
dotnet run --project src/BookShop.Web
```

Open the local address printed by .NET. The database is created in `src/BookShop.Web/data/bookshop.db` and starter books are added on first run. Customer accounts can be created from the site.

To create the first administrator, set `BOOKSHOP_SETUP_KEY` to a private one-time value, run the app, then visit `/admin/setup`. Create the administrator, then remove the setup key from the environment. The setup page closes once an administrator exists. Do not commit setup keys, PayU salts or passwords to this repository.

## Run as a container

Build/publish the app, then build the image from the repository root:

```sh
dotnet publish src/BookShop.Web/BookShop.Web.csproj -c Release -o src/BookShop.Web/bin/Release/net10.0/publish
docker build -t lapcare-bookshop .
docker run --name lapcare-bookshop -p 8080:8080 -v bookshop-data:/app/data \
  -e BOOKSHOP_SETUP_KEY='choose-a-long-one-time-value' lapcare-bookshop
```

The container listens on port `8080`. Mount a persistent volume at `/app/data`; it holds the SQLite database and admin-uploaded covers. Use one app instance with SQLite. For multiple instances, replace SQLite with a shared database and object storage before scaling out.

### Optional PayU settings

Set these as private environment variables in the app host:

| Variable | Purpose |
| --- | --- |
| `PayU__Key` | Merchant key from the PayU dashboard |
| `PayU__Salt` | Merchant salt from the PayU dashboard; keep secret |
| `PayU__IsProduction` | `false` for PayU test, `true` for live payments |
| `PayU__PublicBaseUrl` | Public HTTPS base URL, for example `https://lapcare.dpdns.org` |

PayU is omitted from checkout when the key or salt is absent. Test the complete callback on a public staging URL before enabling live credentials. A real payment merchant account and hosted deployment are required for production payments.

## GitHub and domain hosting

GitHub Actions builds and smoke-checks the app on pushes to `main`. GitHub Pages only hosts static files; it cannot run this MVC application or its database. Use a container-capable app host (or a .NET server) that supports persistent storage, HTTPS and environment secrets. The optional container workflow publishes an image to GitHub Container Registry on a version tag or manual run.

For `lapcare.dpdns.org`, first create the app on the selected host and obtain the DNS target from that provider. Then point the domain's DNS record at that target, add `lapcare.dpdns.org` in the host's custom-domain panel, and wait for HTTPS issuance. The domain is not routed by this repository alone; DNS changes depend on the provider currently controlling `dpdns.org` records.

## GitHub Pages status

This app intentionally is not configured for GitHub Pages because doing so would drop accounts, cart persistence, checkout, admin functions and database-backed catalog behavior. The old Web Forms application also requires an ASP.NET server and SQL database; those services cannot be supplied by Pages.
