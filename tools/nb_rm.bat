@echo off
setlocal

set "TARGET="

:parse
if "%~1"=="" goto parsed
if /i "%~1"=="-r" (
    shift
    goto parse
)
if /i "%~1"=="-f" (
    shift
    goto parse
)
set "TARGET=%~1"
shift
goto parse

:parsed
if not defined TARGET exit /b 0

if exist "%TARGET%" (
    attrib -r "%TARGET%" >nul 2>&1
    del /f /q "%TARGET%" >nul 2>&1
)

if exist "%TARGET%" (
    rmdir /s /q "%TARGET%" >nul 2>&1
)

if exist "%TARGET%" exit /b 1
exit /b 0
