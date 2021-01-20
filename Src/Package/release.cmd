del "*.nupkg"
dotnet clean -c Release ..\ToSic.Oqt.ImageFlow.sln
dotnet build -c Release ..\ToSic.Oqt.ImageFlow.sln
del /F/Q/S "..\Server\bin\Release\net5.0\publish" > NUL
rmdir /Q/S "..\Server\bin\Release\net5.0\publish"
dotnet publish ..\Server\ToSic.Oqt.ImageFlow.Server.csproj /p:Configuration=Release
"..\..\..\oqtane.framework\oqtane.package\nuget.exe" pack ToSic.Oqt.ImageFlow.nuspec
xcopy "*.nupkg" "..\..\InstallPackages" /Y
