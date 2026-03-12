FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /app

COPY . ./           
RUN dotnet restore       
RUN dotnet publish -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:10.0
WORKDIR /app
EXPOSE 5000
COPY --from=build /app/publish ./

ENTRYPOINT ["dotnet"]
CMD ["Opgave_MinimalAPI.dll", "--urls", "http://0.0.0.0:5000"]