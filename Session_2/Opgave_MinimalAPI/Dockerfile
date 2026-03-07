# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /app

# Kopier csproj først og restore dependencies
COPY *.csproj ./
RUN dotnet restore

# Kopier resten af koden og build
COPY . ./
RUN dotnet publish -c Release -o /app/publish

# Stage 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:10.0
WORKDIR /app
EXPOSE 5000

# Kopier kun de publicerede filer
COPY --from=build /app/publish ./

CMD ["dotnet", "Opgave_1_MinimalAPI.dll", "--urls", "http://0.0.0.0:5000"]