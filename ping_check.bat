@echo off
setlocal ENABLEDELAYEDEXPANSION

set target_name=
set target_name=%1

echo Clearing old results...
mkdir ping_check_data

for %%a in (.\ping_check_data\*.txt) do del /Q %%a
if "%target_name%" == "" (
    set target_name=127.0.0.1
    echo Start ping !target_name! with several message sizes, it may take some minutes, please wait...
    echo.
    echo The ping result files are
    for %%a in (32, 64, 2048, 4096, 32768, 65000) do (
        ping !target_name! -n 3 -l %%a > ping_check_data/ping_%target_name%_%%a.txt
        echo    ping_%target_name%_%%a.txt
    )
) else (
    echo Start ping !target_name! with several message sizes, it may take some minutes, please wait...
    echo.
    echo The ping result files are
    for %%a in (32, 64, 2048, 4096, 32768, 65000) do (
        ping !target_name! -n 3 -l %%a > ping_check_data/ping_%target_name%_%%a.txt
        echo    ping_%target_name%_%%a.txt
    )  
)
    
