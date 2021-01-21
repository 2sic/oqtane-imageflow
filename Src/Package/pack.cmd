del /Q/S "*.nupkg"
dotnet clean -c Release ..\ToSic.ImageFlow.Oqt.sln
dotnet build -c Release ..\ToSic.ImageFlow.Oqt.sln
del /F/Q/S "..\Server\bin\Release\net5.0\publish" > NUL
rmdir /Q/S "..\Server\bin\Release\net5.0\publish"
dotnet publish ..\Server\ToSic.ImageFlow.Oqt.Server.csproj /p:Configuration=Release
@REM By convention if you place the oqtane module root folder at the same level as the oqtane framework, then you will not have to modify any folder configuration.
"..\..\..\oqtane.framework\oqtane.package\nuget.exe" pack ToSic.ImageFlow.Oqt-win.nuspec
move /Y *.nupkg win
"..\..\..\oqtane.framework\oqtane.package\nuget.exe" pack ToSic.ImageFlow.Oqt-linux.nuspec
move /Y *.nupkg linux
"..\..\..\oqtane.framework\oqtane.package\nuget.exe" pack ToSic.ImageFlow.Oqt-osx.nuspec
move /Y *.nupkg osx
xcopy /Y/S "*.nupkg" "..\..\InstallPackages"
