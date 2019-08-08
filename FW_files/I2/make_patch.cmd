@echo off
SETLOCAL EnableDelayedExpansion
cd components
del /q /f *
cd ..
copy componentsperm components
cd components
cls
echo %errorlevel%
echo.
echo Which AC?
echo.
echo      [1]Mavic
echo      [2]Spark
echo      [3]P4P
echo      [4]P4std
echo      [5]P4adv 
echo      [6]P4PV2 
echo      [7]I2
echo.
choice /c 1234567 /m "which AC"
if errorlevel 7 set AC=I2 & set fcn1=03.03.
if errorlevel 6 set AC=P4PV2 & set fcn1=03.03.04.
if errorlevel 5 set AC=P4adv & set fcn1=03.02.35.
if errorlevel 4 set AC=P4std & set fcn1=03.02.44.
if errorlevel 3 set AC=P4P & set fcn1=03.02.44.
if errorlevel 2 set AC=Spark & set fcn1=03.02.43.
if errorlevel 1 set AC=Mavic & set fcn1=03.02.44.
echo %Ac%
echo %fcn1%
set /p fcn2="flight controller number ex: %fcn1%xx or ab.ab for I2?"
echo %fcn1%%fcn2%
set /p infos="path to flyc_parm_infos file?"
echo %infos%
copy %infos% %cd%
pause
wsl.exe export PATH_TO_TOOLS=/mnt/c/Users/Brett/Desktop/fcpatcher/tools ; ./FC_patch_sequence_for_dummy_verify.sh %AC% %fcn1%%fcn2%
copy *_dummy_verify.bin ..
pause
ENDLOCAL
exit