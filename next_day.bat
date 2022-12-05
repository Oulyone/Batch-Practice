@echo off
setlocal ENABLEDELAYEDEXPANSION

set date=
set "input=%1"


if "%input%" equ "" (
    set "year=%date:~0,4%"
    set "month=%date:~5,2%"
    set "day=%date:~8,2%"
    goto :checkmonth
) else (
    set "year=!input:~0,4!"
    set "month=!input:~4,2!"
    set "day=!input:~6,2!"
    set /a "mod4=!year!%%4"
    set /a "mod100=!year!%%100"
    set /a "mod400=!year!%%400"
    goto :checkmonth
)

:checkmonth
if "!month!" equ "01" goto :jan 
if "!month!" equ "02" goto :feb 
if "!month!" equ "04" goto :apr
if "!month!" equ "05" goto :may
if "!month!" equ "06" goto :jun
if "!month!" equ "07" goto :jul
if "!month!" equ "08" goto :aug
if "!month!" equ "09" goto :sep
if "!month!" equ "10" goto :oct
if "!month!" equ "11" goto :nov
if "!month!" equ "12" goto :dec

:jan
if "!day!" equ "31" (
   set "day=1"
   set "month=02"
) else (
   set /a "day=!day!+1"
   if !day! lss 10 (
      set "day=0!day!"
   )
)
goto :printdate

:feb
if "!mod4!" equ "0" (
   if "!mod100!" neq "0" (
      goto :feb29day         
   ) else if "!mod100!" equ "0" (
      if "!mod400!" equ "0" (
         goto :feb29day 
      ) else (
         goto :feb28day
      )
   ) 
) else (
   goto :feb28day
)


:feb28day
if "!day!" equ "28" (
    set "day=01"
    set "month=03"
) else (
    set /a "day=!day!+1"
    if !day! lss 10 (
       set "day=0!day!"
    )
)
goto :printdate

:feb29day
if "!day!" equ "28" (
    set "day=29"
) else if "!day!" equ "29" (
   set "day=01"
   set "month=03"
) else (
    set /a "day=!day!+1"
    if !day! lss 10 (
       set "day=0!day!"
    )
)
goto :printdate

:mar
if "!day!" equ "31" (
   set "day=01"
   set "month=04"
) else (
   set /a "day=!day!+1"
   if !day! lss 10 (
      set "day=0!day!"
   )
)
goto :printdate

:apr
if "!day!" equ "30" (
   set "day=01"
   set "month=05"
) else (
   set /a "day=!day!+1"
   if !day! lss 10 (
      set "day=0!day!"
   )
)
goto :printdate

:may
if "!day!" equ "31" (
   set "day=01"
   set "month=06"
) else (
   set /a "day=!day!+1"
   if !day! lss 10 (
      set "day=0!day!"
   )
)
goto :printdate

:jun
if "!day!" equ "30" (
   set "day=01"
   set "month=07"
) else (
   set /a "day=!day!+1"
   if !day! lss 10 (
      set "day=0!day!"
   )
)
goto :printdate

:jul
if "!day!" equ "31" (
   set "day=01"
   set "month=08"
) else (
   set /a "day=!day!+1"
   if !day! lss 10 (
      set "day=0!day!"
   )
)
goto :printdate

:aug
if "!day!" equ "31" (
   set "day=01"
   set "month=09"
) else (
   set /a "day=!day!+1"
   if !day! lss 10 (
      set "day=0!day!"
   )
)
goto :printdate

:sep
if "!day!" equ "30" (
   set "day=01"
   set "month=10"
) else (
   set /a "day=!day!+1"
   if !day! lss 10 (
      set "day=0!day!"
   )
)
goto :printdate

:oct
if "!day!" equ "31" (
   set "day=01"
   set "month=11"
) else (
   set /a "day=!day!+1"
   if !day! lss 10 (
      set "day=0!day!"
   )
)
goto :printdate

:nov
if "!day!" equ "30" (
   set "day=01"
   set "month=12"
) else (
   set /a "day=!day!+1"
   if !day! lss 10 (
      set "day=0!day!"
   )
)
goto :printdate

:dec
if "!day!" equ "31" (
   set "day=01"
   set "month=01"
   set /a "year=!year!+1"
) else (
   set /a "day=!day!+1"
   if !day! lss 10 (
      set "day=0!day!"
   )
)
goto :printdate


:printdate
echo !year!!month!!day!