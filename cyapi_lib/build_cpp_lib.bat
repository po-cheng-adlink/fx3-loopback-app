
@echo off


echo ******************************************************
echo ***        Building CPP library                    ***
echo ******************************************************

echo **** CyAPI_LIB build started for Release Win32 config...

%1MSBuild.exe CyAPI.sln /t:Rebuild /p:Configuration=Release /p:Platform=Win32 >>CyAPI_Release_win32.log
if %ERRORLEVEL%==0 goto success 
if not %ERRORLEVEL%==0 goto fail 

:fail
echo *** Build failed for detail check  CyAPI_Release_win32.log config. check logs.***
goto done

:success
echo **** Success

echo **** CyAPI_LIB build started for Debug Win32 config...


%1MSBuild.exe CyAPI.sln /t:Rebuild /p:Configuration=Debug /p:Platform=Win32 >>CyAPI_Debug_win32.log
if %ERRORLEVEL%==0 goto success 
if not %ERRORLEVEL%==0 goto fail 

:fail
echo *** Build failed for detail check CyAPI_Debug_win32.log config. check logs.***
goto done

:success
echo **** Success

echo **** CyAPI_LIB build started for Release x64 config...

%1MSBuild.exe CyAPI.sln /t:Rebuild /p:Configuration=Release /p:Platform=x64 >>CyAPI_Release_x64.log
if %ERRORLEVEL%==0 goto success 
if not %ERRORLEVEL%==0 goto fail 

:fail
echo *** Build failed for detail check CyAPI_Release_x64.log config. check logs.***
goto done

:success
echo **** Success


echo **** CyAPI_LIB build started for Debug x64 config...


%1MSBuild.exe CyAPI.sln /t:Rebuild /p:Configuration=Debug /p:Platform=x64 >>CyAPI_Debug_x64.log
if %ERRORLEVEL%==0 goto success 
if not %ERRORLEVEL%==0 goto fail 

:fail
echo *** Build failed for detail check CyAPI_Debug_x64.log config. check logs.***
goto done

:success
echo **** Success


:done
echo CyAPI build end