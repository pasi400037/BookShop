FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS runtime
WORKDIR /app
ENV ASPNETCORE_URLS=http://+:8080
ENV ASPNETCORE_FORWARDEDHEADERS_ENABLED=true
ENV ConnectionStrings__BookShop="Data Source=/app/data/bookshop.db"
ENV BOOKSHOP_UPLOADS_DIR=/app/data/uploads
EXPOSE 8080
VOLUME ["/app/data"]
COPY src/BookShop.Web/bin/Release/net10.0/publish/ ./
ENTRYPOINT ["dotnet", "BookShop.Web.dll"]
