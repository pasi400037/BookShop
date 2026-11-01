# BookShop

This repository contains the original BookShop ASP.NET Web Forms application. It uses C# and .NET Framework 4.7.2, ASP.NET Web Forms, and Microsoft SQL Server.

## Hosting compatibility

GitHub Pages cannot run this application. Pages serves static HTML, CSS, and JavaScript; this project relies on ASP.NET server-side pages, C# code-behind, and SQL Server. Publishing these files on Pages would not preserve login, registration, cart, administration, or database-backed book functions.

Keep this source in GitHub if you want version control. To run the full application, deploy it to a Windows IIS or compatible ASP.NET Framework host and provide a reachable SQL Server database. GitHub Pages is suitable only after a deliberate rewrite to a static/front-end app plus a separate backend and database; that rewrite has not been made here.

## Requirements

- Windows with IIS Express/Visual Studio for local development, or Windows IIS for hosting.
- .NET Framework 4.7.2 (or a compatible installed runtime).
- Microsoft SQL Server with the application's expected `BookStore` schema and data.
- A valid database connection string configured on the server.

The archive contains no SQL schema, database backup, or database data. The local connection strings in `BookShop/Web.config` use `localhost\SQLEXPRESS`; change them for your deployment and keep production credentials out of source control. Configure the host's secret/configuration store where supported.

## Open locally

1. Install Visual Studio with ASP.NET and web development tools and the .NET Framework 4.7.2 targeting pack.
2. Open `BookShop.sln`.
3. Restore the NuGet dependencies listed in `BookShop/packages.config`.
4. Create/import the SQL Server database expected by the application. The database backup/schema is not included in this archive.
5. Set both `con` and `BookStoreConnectionString` in `BookShop/Web.config` to your local SQL Server instance.
6. Run the `BookShop` web project with IIS Express.

## Custom domain

`lapcare.dpdns.org` can be used as a custom domain only if it can be pointed to the actual web host. Since this is a server-side ASP.NET application, its DNS must point to the IIS/ASP.NET host, not GitHub Pages. Confirm that the dpdns control panel lets you set the required DNS record for the selected host; a dynamic DNS hostname may need its provider's own update mechanism. Do not change DNS until the application is deployed and the host gives you its target records.

## Repository hygiene

Generated Visual Studio state and build output are excluded. The complete application source, web pages, static assets, Font Awesome files, and book images are included in this repository.
