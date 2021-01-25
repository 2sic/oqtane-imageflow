@REM By convention if you place the oqtane module root folder at the same level as the oqtane framework, then you will not have to modify any folder configuration.
XCOPY "..\Server\bin\Debug\net5.0\ToSic.Imageflow.Oqt.Server.Oqtane.dll" "..\..\..\oqtane.framework\Oqtane.Server\bin\Debug\net5.0\" /Y
XCOPY "..\Server\bin\Debug\net5.0\ToSic.Imageflow.Oqt.Server.Oqtane.pdb" "..\..\..\oqtane.framework\Oqtane.Server\bin\Debug\net5.0\" /Y
XCOPY "..\Server\wwwroot\Modules\ToSic.Imageflow.Oqtane\*" "..\..\..\oqtane.framework\Oqtane.Server\wwwroot\Modules\ToSic.Imageflow.Oqtane\" /Y /S /I
@REM nuget dependences
XCOPY "..\packages\imageflow.server\0.5.6\lib\netcoreapp3.1\Imageflow.Server.dll" "..\..\..\oqtane.framework\Oqtane.Server\bin\Debug\net5.0\" /Y
XCOPY "..\packages\imageflow.server.hybridcache\0.5.6\lib\netcoreapp3.1\Imageflow.Server.HybridCache.dll" "..\..\..\oqtane.framework\Oqtane.Server\bin\Debug\net5.0\" /Y
XCOPY "..\packages\imageflow.net\0.7.21\lib\netstandard2.0\Imageflow.Net.dll" "..\..\..\oqtane.framework\Oqtane.Server\bin\Debug\net5.0\" /Y
XCOPY "..\packages\imageflow.nativeruntime.win-x86_64\1.5.5-rc59\runtimes\win-x64\native\imageflow.dll" "..\..\..\oqtane.framework\Oqtane.Server\bin\Debug\net5.0\runtimes\win-x64\native\" /Y
XCOPY "..\packages\imazen.common\0.5.6\lib\netstandard2.0\Imazen.Common.dll" "..\..\..\oqtane.framework\Oqtane.Server\bin\Debug\net5.0\" /Y
XCOPY "..\packages\imazen.hybridcache\0.5.6\lib\netstandard2.0\Imazen.HybridCache.dll" "..\..\..\oqtane.framework\Oqtane.Server\bin\Debug\net5.0\" /Y
XCOPY "..\packages\microsoft.io.recyclablememorystream\1.2.2\lib\netstandard1.4\Microsoft.IO.RecyclableMemoryStream.dll" "..\..\..\oqtane.framework\Oqtane.Server\bin\Debug\net5.0\" /Y
XCOPY "..\packages\newtonsoft.json\12.0.2\lib\netstandard2.0\Newtonsoft.Json.dll" "..\..\..\oqtane.framework\Oqtane.Server\bin\Debug\net5.0\" /Y
XCOPY "..\packages\microsoft.extensions.configuration.abstractions\5.0.0\lib\netstandard2.0\Microsoft.Extensions.Configuration.Abstractions.dll" "..\..\..\oqtane.framework\Oqtane.Server\bin\Debug\net5.0\" /Y
XCOPY "..\packages\microsoft.extensions.dependencyinjection.abstractions\5.0.0\lib\netstandard2.0\Microsoft.Extensions.DependencyInjection.Abstractions.dll" "..\..\..\oqtane.framework\Oqtane.Server\bin\Debug\net5.0\" /Y
XCOPY "..\packages\microsoft.extensions.logging.abstractions\5.0.0\lib\netstandard2.0\Microsoft.Extensions.Logging.Abstractions.dll" "..\..\..\oqtane.framework\Oqtane.Server\bin\Debug\net5.0\" /Y
XCOPY "..\packages\microsoft.extensions.primitives\5.0.0\lib\netcoreapp3.0\Microsoft.Extensions.Primitives.dll" "..\..\..\oqtane.framework\Oqtane.Server\bin\Debug\net5.0\" /Y
XCOPY "C:\Program Files\dotnet\sdk\NuGetFallbackFolder\microsoft.extensions.fileproviders.abstractions\2.2.0\lib\netstandard2.0\Microsoft.Extensions.FileProviders.Abstractions.dll" "..\..\..\oqtane.framework\Oqtane.Server\bin\Debug\net5.0\" /Y
XCOPY "C:\Program Files\dotnet\sdk\NuGetFallbackFolder\microsoft.extensions.hosting.abstractions\2.2.0\lib\netstandard2.0\Microsoft.Extensions.Hosting.Abstractions.dll" "..\..\..\oqtane.framework\Oqtane.Server\bin\Debug\net5.0\" /Y
