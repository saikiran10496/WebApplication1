@echo off
echo Copying files to WebApplication1 directory...
if not exist "%DEPLOYMENT_TARGET%\WebApplication1" mkdir "%DEPLOYMENT_TARGET%\WebApplication1"
xcopy /Y /E /I "%DEPLOYMENT_SOURCE%\site\wwwroot\WebApplication1" "%DEPLOYMENT_TARGET%\WebApplication1\"
if %ERRORLEVEL% NEQ 0 goto error
echo Deployment Successful.
goto end

:error
echo An error has occurred during web site deployment.
exit /b 1

:end
echo Finished successfully.
