del /Q/S "*.nupkg"
dotnet clean -c Release ..\ToSic.ImageFlow.Oqt.sln
dotnet build -c Release ..\ToSic.ImageFlow.Oqt.sln
del /F/Q/S "..\Server\bin\Release\net5.0\publish" > NUL
rmdir /Q/S "..\Server\bin\Release\net5.0\publish"
dotnet publish ..\Server\ToSic.ImageFlow.Oqt.Server.csproj /p:Configuration=Release
@REM By convention if you place the oqtane module root folder at the same level as the oqtane framework, then you will not have to modify any folder configuration.
"..\..\..\oqtane.framework\oqtane.package\nuget.exe" pack ToSic.ImageFlow.Oqt.win.nuspec
ren ToSic.ImageFlow.Oqt.????.????.????.nupkg ToSic.ImageFlow.Oqt.????.????.????-win.nupkg
move /Y "*.nupkg" "..\..\InstallPackages"
"..\..\..\oqtane.framework\oqtane.package\nuget.exe" pack ToSic.ImageFlow.Oqt.linux.nuspec
ren ToSic.ImageFlow.Oqt.????.????.????.nupkg ToSic.ImageFlow.Oqt.????.????.????-linux.nupkg
move /Y "*.nupkg" "..\..\InstallPackages"
"..\..\..\oqtane.framework\oqtane.package\nuget.exe" pack ToSic.ImageFlow.Oqt.osx.nuspec
ren ToSic.ImageFlow.Oqt.????.????.????.nupkg ToSic.ImageFlow.Oqt.????.????.????-osx.nupkg
move /Y "*.nupkg" "..\..\InstallPackages"
