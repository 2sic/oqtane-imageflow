SET ProjectName=ToSic.Imageflow.Oqtane
SET ModuleTargetFramework=net9.0
del /Q/S "*.nupkg"
dotnet clean -c Release ..\ToSic.Imageflow.Oqtane.sln
dotnet build -c Release ..\ToSic.Imageflow.Oqtane.sln
del /F/Q/S "..\Server\bin\Release\%ModuleTargetFramework%\publish" > NUL
rmdir /Q/S "..\Server\bin\Release\%ModuleTargetFramework%\publish"
dotnet publish ..\Server\ToSic.Imageflow.Oqtane.Server.csproj /p:Configuration=Release
@REM By convention if you place the oqtane module root folder at the same level as the oqtane framework, then you will not have to modify any folder configuration.
@REM linux
.nuget\nuget.exe  pack %ProjectName%.linux.nuspec -Properties targetframework=%ModuleTargetFramework%;projectname=%ProjectName%
ren %ProjectName%.????.????.????.nupkg %ProjectName%.????.????.????-linux.nupkg
@REM osx
.nuget\nuget.exe  pack %ProjectName%.osx.nuspec -Properties targetframework=%ModuleTargetFramework%;projectname=%ProjectName%
ren %ProjectName%.????.????.????.nupkg %ProjectName%.????.????.????-osx.nupkg
@REM win
.nuget\nuget.exe pack %ProjectName%.win.nuspec -Properties targetframework=%ModuleTargetFramework%;projectname=%ProjectName%
ren %ProjectName%.????.????.????.nupkg %ProjectName%.????.????.????-win.nupkg
@REM This step packages the module for all platforms (Linux, macOS, Windows) into a single NuGet package. 
@REM It must be executed last because of package naming.
nuget\nuget.exe pack %ProjectName%.all.nuspec -Properties targetframework=%ModuleTargetFramework%;projectname=%ProjectName%
@REM ren %ProjectName%.????.????.????.nupkg %ProjectName%.????.????.????.nupkg
move /Y "*.nupkg" "..\..\InstallPackages"
