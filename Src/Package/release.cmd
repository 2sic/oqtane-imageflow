del "*.nupkg"
dotnet clean -c Release ..\ToSic.ImageFlow.Oqt.sln
dotnet build -c Release ..\ToSic.ImageFlow.Oqt.sln
del /F/Q/S "..\Server\bin\Release\net5.0\publish" > NUL
rmdir /Q/S "..\Server\bin\Release\net5.0\publish"
dotnet publish ..\Server\ToSic.ImageFlow.Oqt.Server.csproj /p:Configuration=Release
"..\..\..\oqtane.framework\oqtane.package\nuget.exe" pack ToSic.ImageFlow.Oqt.nuspec
xcopy "*.nupkg" "..\..\InstallPackages" /Y
