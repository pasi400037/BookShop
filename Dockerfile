FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /source
COPY src/BookShop.Web/BookShop.Web.csproj src/BookShop.Web/
RUN dotnet restore src/BookShop.Web/BookShop.Web.csproj
COPY src/BookShop.Web/ src/BookShop.Web/
RUN dotnet publish src/BookShop.Web/BookShop.Web.csproj -c Release -o /app/publish --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS runtime
WORKDIR /app
ENV ASPNETCORE_URLS=http://+:8080
ENV ASPNETCORE_FORWARDEDHEADERS_ENABLED=true
ENV ConnectionStrings__BookShop="Data Source=/app/data/bookshop.db"
ENV BOOKSHOP_UPLOADS_DIR=/app/data/uploads
EXPOSE 8080
VOLUME ["/app/data"]
COPY --from=build /app/publish/ ./
ENTRYPOINT ["dotnet", "BookShop.Web.dll"]
