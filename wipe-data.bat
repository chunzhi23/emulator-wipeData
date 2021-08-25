@echo off
title Emulator Wipe Data Processer
setlocal enabledelayedexpansion

:: Your full Sdk > emulator direction
c:
cd %AppData%
cd ..\Local\Android\Sdk\emulator

:main
:: Get emulator(s) data and save as var - emulator name
set cnt=0
for /f "tokens=* delims= " %%i in ('emulator.exe -list-avds') do (
	set /a cnt+=1
	set var[!cnt!]=%%i
)

:: Echo zone
echo.
echo.-- Emulator Wipe Data Processer ------------------^>
echo.
echo. ¡Ù Author: chunzhi23
echo. ¡Ù Hope you all have good use^^!
echo.
echo Your emulator(s) list:
for /l %%i in (1,1,%cnt%) do (
	echo [%%i] !var[%%i]!
)
echo.

set /p num=The emulator number you wanna to wipe data is: 
if "!var[%num%]!" == "" (goto error) else (goto fine)


:fine
cls
echo.
echo.-- Emulator Wipe Data Processer ------------------^>
echo.
echo Process will be soon started after few seconds.
echo It is possible to quit this window after wiping data ends.
echo Hope you have a nice day^^!
echo.
echo.--------------------------------------------------^>
echo.

emulator.exe -avd !var[%num%]! -wipe-data


:error
cls
echo Invaild input detected; Try again please.
goto main