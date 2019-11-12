cd %folderloc%
mkdir %AC%_SP_2.0_%newname%_%fcn1%%fcn2%
set "newdir=%cd%\%AC%_SP_2.0_%newname%_%fcn1%%fcn2%"
cd %patcher%
cd FW_files
cd %AC%
cd components
del /q /f *
cd ..
copy componentsperm components
cd components
echo %infos%
copy %infos% %cd%
@echo on
wsl.exe export PATH_TO_TOOLS=/mnt/c/Users/Brett/Desktop/patcher_/tools ; ./FC_patch_sequence_for_dummy_verify.sh %AC% %fcn1%%fcn2%
if "%AC%"=="Mavic" set AC=MavicPro
if "%AC%"=="P4Adv" set AC=P4A
ren "dji_system_%m%_0306_%fcn1%%fcn2%_dummy_verify.bin" "%AC%_%newname%_%fcn1%%fcn2%_dji_system.bin"
copy *_dummy_verify.bin %newdir%
copy %infos% %newdir%
cd %patcher%
pause
ENDLOCAL
exit
