@echo off



:ask_question
set choice=
set check=
set /P choice="What is your choice(Y/N)? " ^>

if "%choice%"=="Y" (set check=1)
if "%choice%"=="y" (set check=1)

if "%choice%"=="N" (set check=0)
if "%choice%"=="n" (set check=0)

if "%choice%"=="" (set check=2)

if "%check%"=="1" (
	echo "Hello"
) else if "%check%"=="0" (
	echo "Bye"
) else if "%check%"=="2" (
	echo "Nothing"
	goto ask_question
) else ( 
	echo "Incorrect"
	goto ask_question
)