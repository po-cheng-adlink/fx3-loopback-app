@echo off

set srcpath=%CD%
set drive=%CD:~0,2%

if "%1" == "/?" goto usage
if "%1" == "/h" goto usage

rem *** %1 is the CPU type, %2 is chk or fre (debug or release), %3 is the OS (win10 or higher) use lowercase***
if "%1" == ""	goto usage
if "%2" == ""	goto usage
if "%3" == ""	goto usage

call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat"

%drive%
CD %srcpath%
copy /Y cyusb3.txt ..\src\cyusb3.inx
CD ..\src

if "%1"=="x86" (
	set CPU_TYPE=Win32
	set CPU_TYPE_PATH=x86
	echo "32 bit compilation"
)
if "%1"=="x64" (
	set CPU_TYPE=x64
	set CPU_TYPE_PATH=x64
	echo "64 bit compilation"
)

if "%1"=="%CPU_TYPE_PATH%" goto Config
goto ErrorExit

:Config
if "%2"=="chk" goto chkbuild
goto freeBuild
:chkbuild
if "%3"=="Win10" (
	set CONFIGURATION="Debug"
	set CONFIGURATION_PATH="Debug"
        set CONFIGURATION_PATH_8.1="Win8.1Debug"
)

goto performBuild

:freeBuild
echo "Perform Free build"
if "%3"=="Win10" (
	set CONFIGURATION="Release"
	set CONFIGURATION_PATH="Release"
        set CONFIGURATION_PATH_8.1="Win8.1Release"
)


echo "%CONFIGURATION%"
:performBuild
:BuildConfig
msbuild /t:clean /t:build .\cyusb3_win10.sln /p:Configuration=%CONFIGURATION% /p:Platform=%CPU_TYPE%

if "%ERRORLEVEL%"=="0" goto package
goto ErrorExit

:package
md cyusb3
md cyusb3\%3
md cyusb3\%3\%1

copy cyusb3-Package\%1\%CONFIGURATION_PATH_8.1%\cyusb3-Package\*.inf cyusb3\%3\%1
copy cyusb3-Package\%1\%CONFIGURATION_PATH_8.1%\cyusb3-Package\*.dll cyusb3\%3\%1

copy build-objects\%CONFIGURATION_PATH%\%1\cy*.pdb cyusb3\%3\%1
copy build-objects\%CONFIGURATION_PATH%\%1\cy*.sys cyusb3\%3\%1

if "%ERRORLEVEL%"=="0" goto Infpackage
goto ErrorExit

:Infpackage
if "%CPU_TYPE%"=="x64" inf2cat /driver:%CD%\cyusb3\%3\%1 /os:10_x64

if "%CPU_TYPE%"=="Win32" inf2cat /driver:%CD%\cyusb3\%3\%1 /os:10_x86
:goto signature

call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat"

:signature
rem Signtool sign /v /n "Cypress Semiconductor Technology India Pvt Ltd." /ac "C:\WinDDK\Certificate\MSCV-VSClass3.cer" /t http://timestamp.verisign.com/scripts/timstamp.dll %CD%\cyusb3\%3\%1\cyusb3.sys
rem Signtool sign /v /n "Cypress Semiconductor Technology India Pvt Ltd." /ac "C:\WinDDK\Certificate\MSCV-VSClass3.cer" /t http://timestamp.verisign.com/scripts/timstamp.dll %CD%\cyusb3\%3\%1\cyusb3.cat

rem Signtool verify /kp /v /c %CD%\cyusb3\%3\%1\cyusb3.cat %CD%\cyusb3\%3\%1\cyusb3.sys
rem SignTool verify /kp /v /c %CD%\cyusb3\%3\%1\cyusb3.cat %CD%\cyusb3\%3\%1\cyusb3.inf
rem SignTool verify /kp /v %CD%\cyusb3\%3\%1\cyusb3.sys

:success
echo BUILD OPERATION SUCCESSFULLY COMPLETED
goto end

:ErrorExit
echo BUILD OPERATION FAILED PLEASE LOOK AT THE ERROR LOG IN SRC DIR
goto end

:end
cd ..\build_script
echo DONE