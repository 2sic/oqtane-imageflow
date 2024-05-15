@REM By convention if you place the oqtane module root folder at the same level as the oqtane framework, then you will not have to modify any folder configuration.
XCOPY "..\Server\bin\Debug\net7.0\ToSic.Imageflow.Oqt.Server.Oqtane.dll" "..\..\..\oqtane.framework\Oqtane.Server\bin\Debug\net8.0\" /Y
XCOPY "..\Server\bin\Debug\net7.0\ToSic.Imageflow.Oqt.Server.Oqtane.pdb" "..\..\..\oqtane.framework\Oqtane.Server\bin\Debug\net8.0\" /Y
XCOPY "..\Server\wwwroot\Modules\ToSic.Imageflow.Oqtane\*" "..\..\..\oqtane.framework\Oqtane.Server\wwwroot\Modules\ToSic.Imageflow.Oqtane\" /Y /S /I
@REM *** nuget dependences - imageflow, imazen
@REM Imageflow.Server 0.8.3
XCOPY "..\packages\imageflow.server\0.8.3\lib\net6.0\Imageflow.Server.dll" "..\..\..\oqtane.framework\Oqtane.Server\bin\Debug\net8.0\" /Y
@REM Imageflow.Server.HybridCache 0.8.3
XCOPY "..\packages\imageflow.server.hybridcache\0.8.3\lib\net6.0\Imageflow.Server.HybridCache.dll" "..\..\..\oqtane.framework\Oqtane.Server\bin\Debug\net8.0\" /Y
@REM Imazen.Common (>= 0.8.3)
XCOPY "..\packages\imazen.common\0.8.3\lib\netstandard2.0\Imazen.Common.dll" "..\..\..\oqtane.framework\Oqtane.Server\bin\Debug\net8.0\" /Y
@REM Imazen.HybridCache (>= 0.8.3) 
XCOPY "..\packages\imazen.hybridcache\0.8.3\lib\netstandard2.0\Imazen.HybridCache.dll" "..\..\..\oqtane.framework\Oqtane.Server\bin\Debug\net8.0\" /Y
@REM Imageflow.AllPlatforms (>= 0.10.2) 
XCOPY "..\packages\imageflow.allplatforms\0.10.2\lib\netstandard2.0\Imageflow.AllPlatforms.dll" "..\..\..\oqtane.framework\Oqtane.Server\bin\Debug\net8.0\" /Y
@REM Imageflow.Net (>= 0.10.2)
XCOPY "..\packages\imageflow.net\0.10.2\lib\netstandard2.0\Imageflow.Net.dll" "..\..\..\oqtane.framework\Oqtane.Server\bin\Debug\net8.0\" /Y
@REM Imageflow.NativeRuntime.osx-x86_64 (>= 2.0.0-preview8)
@REM Imageflow.NativeRuntime.ubuntu-x86_64 >= 2.0.0-preview8)
@REM Imageflow.NativeRuntime.win-x86 (>= 2.0.0-preview8)
@REM Imageflow.NativeRuntime.win-x86_64 >= 2.0.0-preview8) 
XCOPY "..\packages\imageflow.nativeruntime.win-x86_64\2.0.0-preview8\runtimes\win-x64\native\imageflow.dll" "..\..\..\oqtane.framework\Oqtane.Server\bin\Debug\net8.0\runtimes\win-x64\native\" /Y
XCOPY "..\packages\imageflow.nativeruntime.win-x86\2.0.0-preview8\runtimes\win-x86\native\imageflow.dll" "..\..\..\oqtane.framework\Oqtane.Server\bin\Debug\net8.0\runtimes\win-x86\native\" /Y
@REM Microsoft.IO.RecyclableMemoryStream (>= 1.2.2 && < 3.0.0) 
XCOPY "..\packages\microsoft.io.recyclablememorystream\1.2.2\lib\netstandard1.4\Microsoft.IO.RecyclableMemoryStream.dll" "..\..\..\oqtane.framework\Oqtane.Server\bin\Debug\net8.0\" /Y
@REM *** nuget dependences that are already in Oqtane 3.2.0
@REM Microsoft.CSharp (>= 4.7.0)
@REM Microsoft.Extensions.Hosting.Abstractions (>= 2.2.0)
@REM Microsoft.Bcl.AsyncInterfaces (>= 6.0.0)
@REM Microsoft.Extensions.Configuration.Abstractions (>= 6.0.0)
@REM Microsoft.Extensions.DependencyInjection.Abstractions (>= 6.0.0)
@REM Microsoft.Extensions.FileProviders.Abstractions (>= 6.0.0)
@REM Microsoft.Extensions.Primitives (>= 6.0.0)
@REM System.Buffers (>= 4.5.1)
@REM System.Memory (>= 4.5.5)
@REM System.Numerics.Vectors (>= 4.4.0)
@REM System.Runtime.CompilerServices.Unsafe (>= 6.0.0)
@REM System.Threading.Tasks.Extensions (>= 4.5.4)
@REM System.ValueTuple (>= 4.5.0)
@REM Newtonsoft.Json (>= 13.0.3 && < 14.0.0)
XCOPY "..\packages\newtonsoft.json\13.0.3\lib\net6.0\Newtonsoft.Json.dll" "..\..\..\oqtane.framework\Oqtane.Server\bin\Debug\net8.0\" /Y