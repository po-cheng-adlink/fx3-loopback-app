
echo off
SET BUILDENV=C:\WINDOWS\Microsoft.NET\Framework\v3.5\

echo 
echo ******************************************************
echo ***  Building Bulkloop back sample application     ***
echo ******************************************************
echo 


echo 
echo ****Bulkloop build started for Debug Win32 config...
echo 

%BUILDENV%MSBuild.exe bulkloop.vcproj /t:Rebuild /p:Configuration=Debug /p:Platform=Win32 >>bulkloop_Debug_win32.log
if %ERRORLEVEL%==0 goto success 
if not %ERRORLEVEL%==0 goto fail 

:fail
echo ***Build failed for detail check bulkloop_Debug_win32.log config. check logs.***
goto done

:success
echo 
echo ****Success
echo 

echo 
echo ****bulkloop build started for Release Win32 config...
echo 

%BUILDENV%MSBuild.exe bulkloop.vcproj /t:Rebuild /p:Configuration=Release /p:Platform=Win32 >>bulkloop_Release_win32.log
if %ERRORLEVEL%==0 goto success 
if not %ERRORLEVEL%==0 goto fail 

:fail
echo ***Build failed for detail check  bulkloop_Release_win32.log config. check logs.***
goto done

:success
echo 
echo ****Success
echo 

echo 
echo ****bulkloop build started for Debug x64 config...
echo 

%BUILDENV%MSBuild.exe bulkloop.vcproj /t:Rebuild /p:Configuration=Debug /p:Platform=x64 >>bulkloop_Debug_x64.log
if %ERRORLEVEL%==0 goto success 
if not %ERRORLEVEL%==0 goto fail 

:fail
echo ***Build failed for detail check bulkloop_Debug_x64.log config. check logs.***
goto done

:success
echo 
echo ****Success
echo 

echo 
echo ****bulkloop build started for Release x64 config...
echo 

%BUILDENV%MSBuild.exe bulkloop.vcproj /t:Rebuild /p:Configuration=Release /p:Platform=x64 >>bulkloop_Release_x64.log
if %ERRORLEVEL%==0 goto success 
if not %ERRORLEVEL%==0 goto fail 

:fail
echo ***Build failed for detail check bulkloop_Release_x64.log config. check logs.***
goto done

:success
echo 
echo ****Success
echo 


:done
echo bulkloop application build complete"