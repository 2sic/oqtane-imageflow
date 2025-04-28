@ECHO off
SET ProjectName=%1
SET OqtaneInstallPackage=%2
SET ModuleTargetFramework=%3
REM ModuleTargetFramework is sometimes older than OqtaneTargetFramework to preserve compatibility with older Oqtane versions.
REM Change the OqtaneTargetFramework to TargetFramework from Oqtane.Server.csproj
SET OqtaneTargetFramework=net9.0

ECHO ProjectName=%ProjectName%
ECHO OqtaneInstallPackage=%OqtaneInstallPackage%
ECHO ModuleTargetFramework=%ModuleTargetFramework%
ECHO OqtaneTargetFramework=%OqtaneTargetFramework%

REM enables the use of the ! delimiter for delayed variable expansion.
SETLOCAL enabledelayedexpansion 

SET OqtaneRoot=..\ToSic.Imageflow.Oqtane.Server
SET BuildTarget=%OqtaneRoot%\wwwroot\Modules\%PackageName%

DEL "*.nupkg"
DEL /F/Q/S "..\Server\bin\Release\%ModuleTargetFramework%\publish" > NUL
RMDIR /Q/S "..\Server\bin\Release\%ModuleTargetFramework%\publish"
dotnet publish ..\Server\ToSic.Imageflow.Oqtane.Server.csproj /p:Configuration=Release
@REM By convention if you place the oqtane module root folder at the same level as the oqtane framework, then you will not have to modify any folder configuration.

@REM LINUX
.nuget\nuget.exe pack %ProjectName%.linux.nuspec -Properties targetframework=%ModuleTargetFramework%;projectname=%ProjectName%
REN ToSic.Imageflow.Oqtane.????.????.????.nupkg ToSic.Imageflow.Oqtane.????.????.????-linux.nupkg

@REM MAC
.nuget\nuget.exe pack %ProjectName%.osx.nuspec -Properties targetframework=%ModuleTargetFramework%;projectname=%ProjectName%
REN ToSic.Imageflow.Oqtane.????.????.????.nupkg ToSic.Imageflow.Oqtane.????.????.????-osx.nupkg

@REM WINDOWS (win-arm64, win-x64, win-x86)
.nuget\nuget.exe pack %ProjectName%.win.nuspec -Properties targetframework=%ModuleTargetFramework%;projectname=%ProjectName%
REN ToSic.Imageflow.Oqtane.????.????.????.nupkg ToSic.Imageflow.Oqtane.????.????.????-win.nupkg

@REM This step packages the module for all platforms (Linux, macOS, Windows) into a single NuGet package. 
@REM It must be executed last because of package naming.
.nuget\nuget.exe pack %ProjectName%.all.nuspec -Properties targetframework=%ModuleTargetFramework%;projectname=%ProjectName%
@REM REN ToSic.Imageflow.Oqtane.????.????.????.nupkg ToSic.Imageflow.Oqtane.????.????.????-all.nupkg

@REM XCOPY "*.nupkg" "..\..\..\oqtane.framework\Oqtane.Server\wwwroot\Modules\" /Y

REM performs the string substitution. Specifically, it replaces forward slashes (/) with backslashes (\).
SET "NormalizedPath=!OqtaneInstallPackage:/=\!"
MOVE /Y "*.nupkg" "%NormalizedPath%"
