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
@REM Imageflow.Server 0.8.3
XCOPY "..\packages\imageflow.server\0.8.3\lib\net6.0\Imageflow.Server.dll" "%OqtaneBin%\" /Y
@REM Imageflow.Server.HybridCache 0.8.3
XCOPY "..\packages\imageflow.server.hybridcache\0.8.3\lib\net6.0\Imageflow.Server.HybridCache.dll" "%OqtaneBin%\" /Y
@REM Imazen.Common (>= 0.8.3)
XCOPY "..\packages\imazen.common\0.8.3\lib\netstandard2.0\Imazen.Common.dll" "%OqtaneBin%\" /Y
@REM Imazen.HybridCache (>= 0.8.3) 
XCOPY "..\packages\imazen.hybridcache\0.8.3\lib\netstandard2.0\Imazen.HybridCache.dll" "%OqtaneBin%\" /Y
@REM Imageflow.AllPlatforms (>= 0.14.0-rc01) 
XCOPY "..\packages\imageflow.allplatforms\0.14.0-rc01\lib\net8.0\Imageflow.AllPlatforms.dll" "%OqtaneBin%\" /Y
@REM Imageflow.Net (>= 0.14.0-rc01)
XCOPY "..\packages\imageflow.net\0.14.0-rc01\lib\net8.0\Imageflow.Net.dll" "%OqtaneBin%\" /Y
@REM Imageflow.NativeRuntime.osx-arm64 (>= 2.1.0-rc11)
@REM Imageflow.NativeRuntime.osx-x86_64 (>= 2.1.0-rc11)
@REM Imageflow.NativeRuntime.ubuntu-arm64 >= 2.1.0-rc07)
@REM Imageflow.NativeRuntime.ubuntu-x86_64 >= 2.1.0-rc11)
@REM Imageflow.NativeRuntime.win-arm64 (>= 2.1.0-rc11)
XCOPY "..\packages\imageflow.nativeruntime.win-arm64\2.1.0-rc11\runtimes\win-arm64\native\imageflow.dll" "%OqtaneBin%\runtimes\win-arm64\native\" /Y
@REM Imageflow.NativeRuntime.win-x86 (>= 2.1.0-rc11)
XCOPY "..\packages\imageflow.nativeruntime.win-x86\2.1.0-rc11\runtimes\win-x86\native\imageflow.dll" "%OqtaneBin%\runtimes\win-x86\native\" /Y
@REM Imageflow.NativeRuntime.win-x86_64 >= 2.1.0-rc11) 
XCOPY "..\packages\imageflow.nativeruntime.win-x86_64\2.1.0-rc11\runtimes\win-x64\native\imageflow.dll" "%OqtaneBin%\runtimes\win-x64\native\" /Y
@REM Microsoft.IO.RecyclableMemoryStream (>= 3.0.1 && < 4.0.0) 
XCOPY "..\packages\microsoft.io.recyclablememorystream\3.0.1\lib\net6.0\Microsoft.IO.RecyclableMemoryStream.dll" "%OqtaneBin%\" /Y
@REM System.Text.Json (>= 6.0.11)
@REM - v9.0.0.0 is part of Oqtane 6.1.0 or 2sxc v19.00.01+