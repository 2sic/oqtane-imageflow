del /Q/S "*.nupkg"
dotnet clean -c Release ..\ToSic.Imageflow.Oqtane.sln
dotnet build -c Release ..\ToSic.Imageflow.Oqtane.sln
del /F/Q/S "..\Server\bin\Release\net7.0\publish" > NUL
rmdir /Q/S "..\Server\bin\Release\net7.0\publish"
dotnet publish ..\Server\ToSic.Imageflow.Oqtane.Server.csproj /p:Configuration=Release
@REM By convention if you place the oqtane module root folder at the same level as the oqtane framework, then you will not have to modify any folder configuration.
.nuget\nuget.exe pack ToSic.Imageflow.Oqtane.win.nuspec
ren ToSic.Imageflow.Oqtane.????.????.????.nupkg ToSic.Imageflow.Oqtane.????.????.????-win.nupkg
move /Y "*.nupkg" "..\..\InstallPackages"
.nuget\nuget.exe  pack ToSic.Imageflow.Oqtane.linux.nuspec
ren ToSic.Imageflow.Oqtane.????.????.????.nupkg ToSic.Imageflow.Oqtane.????.????.????-linux.nupkg
move /Y "*.nupkg" "..\..\InstallPackages"
.nuget\nuget.exe  pack ToSic.Imageflow.Oqtane.osx.nuspec
ren ToSic.Imageflow.Oqtane.????.????.????.nupkg ToSic.Imageflow.Oqtane.????.????.????-osx.nupkg
move /Y "*.nupkg" "..\..\InstallPackages"
