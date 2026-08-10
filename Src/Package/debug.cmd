SET BuildFolder=%1
SET OqtaneTarget=%2
SET ModuleTargetFramework=%3
REM ModuleTargetFramework is sometimes older than OqtaneTargetFramework to preserve compatibility with older Oqtane versions.
REM Change the OqtaneTargetFramework to TargetFramework from Oqtane.Server.csproj
SET OqtaneTargetFramework=net9.0

ECHO BuildFolder=%BuildFolder%
ECHO OqtaneTarget=%OqtaneTarget%
ECHO ModuleTargetFramework=%ModuleTargetFramework%
ECHO OqtaneTargetFramework=%OqtaneTargetFramework%

SET OqtaneBin=%OqtaneTarget%bin\%BuildFolder%\%OqtaneTargetFramework%
SET PackageName=ToSic.Sxc.Oqtane
SET BuildTarget=%OqtaneTarget%wwwroot\Modules\%PackageName%
ECHO The target folder is: %OqtaneBin%

@REM By convention if you place the oqtane module root folder at the same level as the oqtane framework, then you will not have to modify any folder configuration.
XCOPY "..\Server\bin\%BuildFolder%\%ModuleTargetFramework%\ToSic.Imageflow.Oqt.Server.Oqtane.dll" "%OqtaneBin%\" /Y
XCOPY "..\Server\bin\%BuildFolder%\%ModuleTargetFramework%\ToSic.Imageflow.Oqt.Server.Oqtane.pdb" "%OqtaneBin%\" /Y
XCOPY "..\Server\wwwroot\Modules\ToSic.Imageflow.Oqtane\*" "..\..\..\oqtane.framework\Oqtane.Server\wwwroot\Modules\ToSic.Imageflow.Oqtane\" /Y /S /I
@REM *** nuget dependences - imageflow, imazen
@REM Imageflow.Server
XCOPY "..\Server\bin\%BuildFolder%\%ModuleTargetFramework%\Imageflow.Server.dll" "%OqtaneBin%\" /Y
@REM Imageflow.Server.HybridCache
XCOPY "..\Server\bin\%BuildFolder%\%ModuleTargetFramework%\Imageflow.Server.HybridCache.dll" "%OqtaneBin%\" /Y
@REM Imazen.Common
XCOPY "..\Server\bin\%BuildFolder%\%ModuleTargetFramework%\Imazen.Common.dll" "%OqtaneBin%\" /Y
@REM Imazen.HybridCache
XCOPY "..\Server\bin\%BuildFolder%\%ModuleTargetFramework%\Imazen.HybridCache.dll" "%OqtaneBin%\" /Y
@REM Imageflow.AllPlatforms
XCOPY "..\Server\bin\%BuildFolder%\%ModuleTargetFramework%\Imageflow.AllPlatforms.dll" "%OqtaneBin%\" /Y
@REM Imageflow.Net
XCOPY "..\Server\bin\%BuildFolder%\%ModuleTargetFramework%\Imageflow.Net.dll" "%OqtaneBin%\" /Y
@REM Imageflow.NativeRuntime.linux-arm64
XCOPY "..\Server\bin\%BuildFolder%\%ModuleTargetFramework%\runtimes\linux-arm64\native\libimageflow.so" "%OqtaneBin%\runtimes\linux-arm64\native\" /Y
@REM Imageflow.NativeRuntime.linux-x64
XCOPY "..\Server\bin\%BuildFolder%\%ModuleTargetFramework%\runtimes\linux-x64\native\libimageflow.so" "%OqtaneBin%\runtimes\linux-x64\native\" /Y
@REM Imageflow.NativeRuntime.osx-arm64
XCOPY "..\Server\bin\%BuildFolder%\%ModuleTargetFramework%\runtimes\osx-arm64\native\libimageflow.dylib" "%OqtaneBin%\runtimes\osx-arm64\native\" /Y
@REM Imageflow.NativeRuntime.osx-x64
XCOPY "..\Server\bin\%BuildFolder%\%ModuleTargetFramework%\runtimes\osx-x64\native\libimageflow.dylib" "%OqtaneBin%\runtimes\osx-x64\native\" /Y
@REM Imageflow.NativeRuntime.win-arm64
XCOPY "..\Server\bin\%BuildFolder%\%ModuleTargetFramework%\runtimes\win-arm64\native\imageflow.dll" "%OqtaneBin%\runtimes\win-arm64\native\" /Y
@REM Imageflow.NativeRuntime.win-x64
XCOPY "..\Server\bin\%BuildFolder%\%ModuleTargetFramework%\runtimes\win-x64\native\imageflow.dll" "%OqtaneBin%\runtimes\win-x64\native\" /Y
@REM Imageflow.NativeRuntime.win-x86
XCOPY "..\Server\bin\%BuildFolder%\%ModuleTargetFramework%\runtimes\win-x86\native\imageflow.dll" "%OqtaneBin%\runtimes\win-x86\native\" /Y
@REM Microsoft.IO.RecyclableMemoryStream (>= 3.0.1 && < 4.0.0)
XCOPY "..\Server\bin\%BuildFolder%\%ModuleTargetFramework%\Microsoft.IO.RecyclableMemoryStream.dll" "%OqtaneBin%\" /Y
@REM System.Text.Json (>= 6.0.11)
@REM - v9.0.0.0 is part of Oqtane 6.1.0 or 2sxc v19.00.01+