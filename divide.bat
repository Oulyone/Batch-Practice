@echo off
setlocal ENABLEDELAYEDEXPANSION

set "firstdiv=0"
set "num1=335"
set "num2=113"

rem loop 11 time for 10 digit
for /l %%f in (0,1,10) do ( 
   rem first div the result will be "div".
   if "!firstdiv!" neq "1" (
      set /a "div=!num1!/!num2!"
      set "result=!div!."
      set "firstdiv=1"
      call :divide1
   ) else (
      set "result=!result!!div!"
      call :divide1
   )
)
echo %result%
goto :eof

:divide1
 set /a "mod=!num1!%%!num2!"
 rem check if mod not equal 0, will set num 1 = mod*10
 if "!mod!" neq "0" (
    set /a "num1=!mod!*10"
    set /a "div=!num1!/!num2!"
 ) else (
    set "div=0"
 )


rem for /l %%f in (0,1,10) do (
rem    if "!firstdiv!" neq "1" (
rem       set /a "div=!num1!/!num2!"
rem       set "result=!div!."
rem       set /a "mod=!num1!%%!num2!"
rem       if "!mod!" neq "0" (
rem          set /a "num1=!mod!*10"
rem          set /a "div=!num1!/!num2!"
rem       ) else (
rem          set "div=0"
rem       )
rem       set "firstdiv=1"
rem    ) else (
rem       set "result=!result!!div!"
rem       set /a "mod=!num1!%%!num2!"
rem       if "!mod!" neq "0" (
rem          set /a "num1=!mod!*10"
rem          set /a "div=!num1!/!num2!"
rem       )   else (
rem          set "div=0"
rem       )

rem    )
rem )

