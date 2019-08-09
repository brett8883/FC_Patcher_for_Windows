@echo off
SETLOCAL EnableDelayedExpansion
set SP2=%cd%
cd FW_files
set fwf=%cd%
echo.
echo Which AC?
echo.
echo      [1] MavicPro/MP Platinum/MP Alpine White
echo      [2] Spark
echo      [3] P4P
echo      [4] P4std
echo      [5] P4adv 
echo      [6] P4PV2 
echo      [7] I2
echo.
choice /c 1234567 /m "which AC"
if errorlevel 7 set "AC=I2" & set "fcn1=03.03." & cd I2 & set "m=wm620" & goto I2
if errorlevel 6 set "AC=P4PV2" & set "fcn1=03.03.04." & cd P4PV2 & set "m=wm335" & goto else
if errorlevel 5 set "AC=P4adv" & set "fcn1=03.02.35." & cd P4adv & set "m=wm332" & goto else
if errorlevel 4 set "AC=P4std" & set "fcn1=03.02.44." & cd P4std & set "m=wm330" & goto else
if errorlevel 3 set "AC=P4P" & set "fcn1=03.02.44." & cd p4p & set "m=wm331" & goto else
if errorlevel 2 set "AC=Spark" & set "fcn1=03.02.43." & cd spark & set "m=wm100" & goto else
if errorlevel 1 set "AC=Mavic" & set "fcn1=03.02.44." & cd mavic & set "m=wm220" & goto else

:else
set /p fcn2="flight controller number ex: %fcn1%xx?"

:main
echo %fcn1%%fcn2%
set /p infos="path to flyc_parm_infos file?"
set /p newname="new file name?"
cd components
del /q /f *
cd ..
copy componentsperm components
cd components
echo %infos%
copy %infos% %cd%
@echo on
wsl.exe export PATH_TO_TOOLS=/mnt/c/Users/Brett/Desktop/SP2/tools ; ./FC_patch_sequence_for_dummy_verify.sh %AC% %fcn1%%fcn2%
copy *_dummy_verify.bin %SP2%
cd %SP2%
if "%AC%"=="Mavic" set AC=MavicPro
ren "dji_system_%m%_0306_%fcn1%%fcn2%_dummy_verify.bin" "%AC%_%newname%_%fcn1%%fcn2%_dji_system.bin"
pause
ENDLOCAL
exit

:I2
echo %AC%
echo %fcn1%
set /p fcn3="flight controller number ex:%fcn1%ab.ab?"
set fcn2=%fcn3%.%fcn3%
goto main