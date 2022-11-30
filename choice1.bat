@echo off

set choice=
set check=

set /P choice="What is your choice(Y/N)?" ^>

if "%choice%"=="Y" (set check=1)
if "%choice%"=="y" (set check=1)
if "%choice%"=="" (set check=1)

if "%choice%"=="N" (set check=0)
if "%choice%"=="n" (set check=0)

if "%check%"=="1" (
	echo "Hello"
) else if "%check%"=="0" (
	echo "Bye"
) else ( 
	echo "Incorrect"
)