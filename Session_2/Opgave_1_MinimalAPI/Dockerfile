FROM mcr.microsoft.com/dotnet/sdk:10.0
WORKDIR /app
EXPOSE 5000
COPY . .
RUN dotnet restore
CMD ["dotnet", "run", "--urls", "http://0.0.0.0:5000"]