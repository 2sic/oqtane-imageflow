del "*.nupkg"
del /F/Q/S "..\Server\bin\Release\net6.0\publish" > NUL
rmdir /Q/S "..\Server\bin\Release\net6.0\publish"
dotnet publish ..\Server\ToSic.Imageflow.Oqtane.Server.csproj /p:Configuration=Release
@REM By convention if you place the oqtane module root folder at the same level as the oqtane framework, then you will not have to modify any folder configuration.
.nuget\nuget.exe pack ToSic.Imageflow.Oqtane.nuspec
ren ToSic.Imageflow.Oqtane.????.????.????.nupkg ToSic.Imageflow.Oqtane.????.????.????-all.nupkg
xcopy "*.nupkg" "..\..\..\oqtane.framework\Oqtane.Server\wwwroot\Modules\" /Y
move /Y "*.nupkg" "..\..\InstallPackages"
