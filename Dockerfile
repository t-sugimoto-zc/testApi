FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src
COPY ["SimpleRestApi/SimpleRestApi.csproj", "SimpleRestApi/"]
RUN dotnet restore "SimpleRestApi/SimpleRestApi.csproj"
COPY . .
WORKDIR "/src/SimpleRestApi"
RUN dotnet build "SimpleRestApi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "SimpleRestApi.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "SimpleRestApi.dll"]
