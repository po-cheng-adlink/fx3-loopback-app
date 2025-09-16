@echo off

echo -e "\r"
echo -e "******************************************************\r"
echo -e "***    Building Driver for all platfrom            ***\r"
echo -e "******************************************************\r"
echo -e "\r"

rd ..\src\cyusb3 /s/q

echo ********Win8.1-X86-fre Build********
CMD /c wdkbld_7_or_higher x86 fre Win8.1
echo ********Win8.1-X64-fre Build********
CMD /c wdkbld_7_or_higher x64 fre Win8.1

echo ********Win10-X86-fre Build********
CMD /c wdkbld_10_or_higher x86 fre Win10
echo ********Win10-X64-fre Build********
CMD /c wdkbld_10_or_higher x64 fre Win10

echo ********Win8-X86-fre Build********
CMD /c wdkbld_7_or_higher x86 fre Win8

echo ********Win8-X64-fre Build********
CMD /c wdkbld_7_or_higher x64 fre Win8

echo ********Win7-X86-fre Build********
CMD /c wdkbld_7_or_higher x86 fre Win7

echo ********Win7-X64-fre Build********
CMD /c wdkbld_7_or_higher x64 fre Win7


echo ********Vista-X86-fre Build********
CMD /c wdkbuild x86 fre wlh vista

echo ********Vista-X64-fre Build********
CMD /c wdkbuild x64 fre wlh vista

echo ********XP-X86-fre Build********
CMD /c wdkbuild x86 fre wxp wxp

echo ********XP-X64-fre Build********
CMD /c wdkbuild x64 fre WNET wxp

rd ..\src\Build-Objects /s/q
rd ..\src\Packaging-Log /s/q
rd ..\src\objfre_wlh_amd64 /s/q
rd ..\src\objfre_wlh_x86 /s/q
rd ..\src\objfre_wnet_amd64 /s/q
rd ..\src\objfre_wxp_x86 /s/q
del ..\src\buildfre*.log

rd ..\src\cyusb3-Package\x86 /s/q
rd ..\src\cyusb3-Package\x64 /s/q
