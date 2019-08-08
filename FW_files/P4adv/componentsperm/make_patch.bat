@echo off
rmdir /Q /S nonemptydir tmp 
cd components
mkdir tmp
copy *.* tmp
copy tmp ..
rmdir /Q /S nonemptydir tmp
cd ..
cd tmp
set /p fcn="flight controller number?"
echo %fcn%
wsl.exe export PATH_TO_TOOLS=/mnt/c/Users/Brett/Desktop/fcpatcher/MavicPro_patches/tools ; ./FC_patch_sequence_for_dummy_verify.sh Mavic %fcn%
pause