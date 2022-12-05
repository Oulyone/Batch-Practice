@echo off
rem Enable delay expansion for set target_name 
rem Note: Local variable need to use !variable! instead %variable%
setlocal ENABLEDELAYEDEXPANSION

rem clear value in target_name
set target_name=
set target_name=%1

echo Clearing old results...

rem create a directory to store ping data
mkdir ping_check_data

rem for loop delete .txt file in folder ping_check_data
for %%a in (.\ping_check_data\*.txt) do del %%a

rem check target_name value if user not enter input ip then target_name is 127.0.0.1
if "%target_name%" == "" (
    set target_name=127.0.0.1
    echo Start ping !target_name! with several message sizes, it may take some minutes, please wait...
    echo.
    echo The ping result files are

    rem for loop to create txt file that store data of command ping
    for %%a in (32, 64, 2048, 4096, 32768, 65000) do (
        ping !target_name! -w 1500 -n 10 -l %%a > ping_check_data/ping_!target_name!_%%a.txt
        echo    ping_!target_name!_%%a.txt
    )
) else ( 
    echo Start ping !target_name! with several message sizes, it may take some minutes, please wait...
    echo.
    echo The ping result files are
    for %%a in (32, 64, 2048, 4096, 32768, 65000) do (
        ping !target_name! -w 1500 -n 10 -l %%a > ping_check_data/ping_!target_name!_%%a.txt
        echo    ping_!target_name!_%%a.txt
    )  
)
    
