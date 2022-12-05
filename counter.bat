@echo off

set "firstpara=%1"
set "secondpara=%2"

rem check if not enter input will print 1 to 10
if "%firstpara%" equ "" (
   if "%secondpara%" equ "" (
       for /l %%f in (1,1,10) do echo %%f
   )
)

rem check if enter only one input will print 1 to first parameter
if "%firstpara%" neq "" (
   rem check if enter two input will check what paremeter greter than anoter
   if "%secondpara%" neq "" (
       if "%firstpara%" gtr "%secondpara%" (
         for /l %%f in (%firstpara%,-1,%secondpara%) do echo %%f
       ) else if "%secondpara%" gtr "%firstpara%" (
         for /l %%f in (%firstpara%,1,%secondpara%) do echo %%f
       ) else if "%secondpara%" equ "%firstpara%" (
         echo %firstpara%
       )
   ) else (
      for /l %%f in (1,1,%firstpara%) do echo %%f
   )
)