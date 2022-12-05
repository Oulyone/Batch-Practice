@echo off

set ip_address_string="IPv4 Address"

rem /C:string  Uses specified string as a literal search string.
rem | output of one command into the input of another command


rem ipconfig | findstr /c:"IPv4 Address" ---> result is
rem    IPv4 Address. . . . . . . . . . . : 192.168.56.1
rem    IPv4 Address. . . . . . . . . . . : 192.168.27.1
rem    IPv4 Address. . . . . . . . . . . : 192.168.32.1
rem    IPv4 Address. . . . . . . . . . . : 192.168.1.105

rem use delims=: to seperate IPv4 Address. . . . . . . . . . . : 192.168.56.1
rem use tokens=2 passed second token from each line to for body ---> 192.168.56.1

for /f "usebackq tokens=2 delims=:" %%f in (`ipconfig ^| findstr /c:%ip_address_string%`) do (
    echo Your IP Address is: %%f

    rem use goto :eof to break for loop
    goto :eof
)

