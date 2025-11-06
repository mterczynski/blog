@echo off
REM Script to easily switch between Hugo themes (Windows version)

setlocal enabledelayedexpansion

set THEMES_DIR=themes
set CONFIG_FILE=hugo.yaml

echo Available themes:
set count=0
for /d %%d in (%THEMES_DIR%\*) do (
    set /a count+=1
    set "theme[!count!]=%%~nxd"
    echo   !count!. %%~nxd
)

if %count%==0 (
    echo No themes found in %THEMES_DIR%/
    exit /b 1
)

echo.
for /f "tokens=2" %%a in ('findstr /b "theme:" %CONFIG_FILE%') do set current_theme=%%a
echo Current theme: %current_theme%
echo.

set /p selection="Enter theme number or name (or press Enter to cancel): "

if "%selection%"=="" (
    echo Cancelled.
    exit /b 0
)

REM Check if selection is a number
set new_theme=
echo %selection%| findstr /r "^[0-9][0-9]*$" >nul
if %errorlevel%==0 (
    set new_theme=!theme[%selection%]!
) else (
    set new_theme=%selection%
)

if not exist "%THEMES_DIR%\%new_theme%" (
    echo Theme '%new_theme%' not found in %THEMES_DIR%/
    exit /b 1
)

REM Update config file
powershell -Command "(Get-Content %CONFIG_FILE%) -replace '^theme:.*', 'theme: %new_theme%' | Set-Content %CONFIG_FILE%"

echo.
echo Theme switched to: %new_theme%
echo.
echo Run 'hugo server' to preview the new theme.
