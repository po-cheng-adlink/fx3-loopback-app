@echo off


echo ******************************************************
echo ***  		Building C# DLL and Application         ***
echo ******************************************************

echo **** CyUSB solution build started for Release AnyCPU config...


%1MSBuild.exe CyUSB.sln /t:Rebuild /p:Configuration=Release >>CyUSB_Release_AnyCPU.log
if %ERRORLEVEL%==0 goto success 
if not %ERRORLEVEL%==0 goto fail 

:fail
echo *** Build failed for detail check  CyUSB_Release_AnyCPU.log config. check logs. ***
goto done

:success
echo **** Success

echo **** CyUSB solution build started for Debug AnyCPU config...

%1MSBuild.exe CyUSB.sln /t:Rebuild /p:Configuration=Debug >>CyUSB_Debug_AnyCPU.log
if %ERRORLEVEL%==0 goto success 
if not %ERRORLEVEL%==0 goto fail 

:fail
echo *** Build failed for detail check CyUSB_Debug_AnyCPU.log config. check logs.***
goto done

:success
echo **** Success


:done
echo CyUSB solution Build completed end