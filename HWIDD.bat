@echo off
setlocal

set "hwid="
for /f "usebackq tokens=2 delims==" %%A in (`wmic csproduct get uuid /value 2^>nul`) do (
    set "hwid=%%A"
)
set "hwid=quickozzy-lock-hwid-%hwid%"

set "url=https://pastebin.com/X8vucvt2"
curl "%url%" -o response.txt

cls

:printSlow
setlocal enabledelayedexpansion
set "text=Load Hwid ..."
for /L %%N in (0,1,11) do (
    <nul set /p "=!text:~%%N,1!"
    timeout /t 0.1 >nul
)
endlocal

cls

@echo Off
Mode 130,25
    title HWID NOT FOUNO
    chcp 65001
    cls
    ECHO.
    ECHO.        █░█ █░█░█ █ █▀▄   █▄░█ █▀█ ▀█▀   █▀▀ █▀█ █░█ █▄░█ █▀█
    ECHO.        █▀█ ▀▄▀▄▀ █ █▄▀   █░▀█ █▄█ ░█░   █▀░ █▄█ █▄█ █░▀█ █▄█  
    ECHO.

setlocal enabledelayedexpansion
findstr /c:"!hwid!" "response.txt" >nul
if errorlevel 1 (
    echo Error HWID NOT FOUNO! HWID Not in Database!
    echo HWID: !hwid!
    pause
    exit /b
)

rem Your main program logic here

endlocal