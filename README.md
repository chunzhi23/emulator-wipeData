# Wiping emulator's data on batch
This is a batch file that allows us to wipe emulator's data on batch.<br>
There could be another way to wipe data(such as using Android Studio or another batch commands), so when you connected more efficient way to do same thing with batch, please let us know, and that would be truely appreciated.<br>
## Code
```
@echo off
title Emulator Wipe Data Processer
setlocal enabledelayedexpansion

:: Your full Sdk > emulator direction
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
echo. ☆ Author: chunzhi23
echo. ☆ Hope you all have good use^^!
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
```
## Useful notice
When the batch file notify you error about direction, try to edit this part:
```
:: Your full Sdk > emulator direction
cd %AppData%
cd ..\Local\Android\Sdk\emulator
```
Direction error could occur on account of individual's sdk location.<br>
So change this command into this may be fine.
```
cd [Your direction]
```
