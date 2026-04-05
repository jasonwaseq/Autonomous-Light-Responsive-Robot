@echo off
setlocal

if "%~1"=="" exit /b 0

set "TARGET=%~1"
mkdir "%TARGET%" >nul 2>&1

if exist "%TARGET%" exit /b 0
exit /b 1
