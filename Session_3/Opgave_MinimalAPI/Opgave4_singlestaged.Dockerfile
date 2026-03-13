# Vi bruger KUN det store SDK image
FROM mcr.microsoft.com/dotnet/sdk:10.0
WORKDIR /app

# Kopier alt og build
COPY *.csproj ./
RUN dotnet restore
COPY . ./
RUN dotnet publish -c Release -o /app/publish

# Vi bygger IKKE et nyt runtime image, vi kører det direkte herfra!
EXPOSE 5000
CMD ["dotnet", "/app/publish/Opgave_MinimalAPI.dll", "--urls", http://0.0.0.0:5000"]