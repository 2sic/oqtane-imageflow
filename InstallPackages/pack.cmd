@cd ..\Src\Package\
@call release.cmd 
@cd ..\..\InstallPackages\
@REM xcopy "*.nupkg" "..\..\oqtane.framework\Oqtane.Server\wwwroot\Modules\" /Y