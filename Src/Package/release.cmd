del "*.nupkg"
del /F/Q/S "..\Server\bin\Release\net5.0\publish" > NUL
rmdir /Q/S "..\Server\bin\Release\net5.0\publish"
dotnet publish ..\Server\ToSic.ImageFlow.Oqt.Server.csproj /p:Configuration=Release
@REM By convention if you place the oqtane module root folder at the same level as the oqtane framework, then you will not have to modify any folder configuration.
"..\..\..\oqtane.framework\oqtane.package\nuget.exe" pack ToSic.ImageFlow.Oqt.nuspec
xcopy "*.nupkg" "..\..\..\oqtane.framework\Oqtane.Server\wwwroot\Modules\" /Y
xcopy /Y/S "*.nupkg" "..\..\InstallPackages"
