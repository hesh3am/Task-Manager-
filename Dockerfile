
# frst stage base image
FROM mcr.microsoft.com/dotnet/sdk:7.0 As build
WORKDIR /source

# copy and restor the dependancy
COPY *.csproj .
RUN dotnet restore

# copy and publsh app file
COPY . /source/.
RUN dotnet publish -c release -o /app 

FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build /app .

ENTRYPOINT [ "dotnet","SimpleWebAppMVC.dll" ]
 
