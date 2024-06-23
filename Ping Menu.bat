@echo off
title Ping Menu
setlocal enabledelayedexpansion
color 1

:menu
cls
:::  _____  _____  _   _   _____     __  __  ______  _   _  _    _ 
::: |  __ \|_   _|| \ | | / ____|   |  \/  ||  ____|| \ | || |  | |
::: | |__) | | |  |  \| || |  __    | \  / || |__   |  \| || |  | |
::: |  ___/  | |  | . ` || | |_ |   | |\/| ||  __|  | . ` || |  | |
::: | |     _| |_ | |\  || |__| |   | |  | || |____ | |\  || |__| |
::: |_|    |_____||_| \_| \_____|   |_|  |_||______||_| \_| \____/
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A

echo by Tactics.
echo.
echo 1. Amazon.com
echo 2. Bing.com
echo 3. Cloudflare.com
echo 4. Custom IP
echo 5. Custom Website
echo 6. GitHub.com
echo 7. Facebook.com
echo 8. Google.com (8.8.8.8)
echo 9. Microsoft.com
echo 0. Reddit.com
echo.
echo For help, type "help"
echo To exit, type "exit"
echo To trace route, type "trace"
echo.
set /p option=Enter your choice: 

if "%option%"=="1" (
    cls
    set site=amazon.com
) else if "%option%"=="2" (
    cls
    set site=204.79.197.200
) else if "%option%"=="3" (
    cls
    set site=cloudflare.com
) else if "%option%"=="4" (
    cls
    set /p site=Enter the IP address to ping: 
) else if "%option%"=="5" (
    cls
    set /p site=Enter the website to ping: 
) else if /i "%option%"=="exit" (
    exit
) else if "%option%"=="6" (
    cls
    set site=github.com
) else if "%option%"=="7" (
    cls
    set site=facebook.com
) else if "%option%"=="8" (
    cls
    set site=8.8.8.8
) else if "%option%"=="9" (
    cls
    set site=microsoft.com
) else if "%option%"=="0" (
    cls
    set site=reddit.com
) else if /i "%option%"=="trace" (
    goto :trace
) else if /i "%option%"=="help" (
    goto :help
) else (
    echo Invalid option. Please try again.
    pause
    goto :menu
)

echo Pinging %site%...
ping %site% -n 4
pause
goto :menu

:trace
cls
set /p site=Enter the website or IP address to trace: 
echo Tracing route to %site%...
tracert %site%
pause
goto :menu

:help
cls
echo This script allows you to ping various websites or IP addresses to check your internet connectivity.
echo You can choose from a list of predefined sites, or enter a custom website or IP address.
echo After you make a selection, the script will ping the selected site and display the results.
echo You can also trace the route to a website or IP address by typing "trace".
echo.
echo Coded By Tactics.
echo github.com/tactics-osrs
echo.
pause
goto :menu

