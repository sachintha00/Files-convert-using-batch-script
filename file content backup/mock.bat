@echo off
setlocal enabledelayedexpansion

set "sourceFile=input.txt"
set "backupFile=backup.txt"

if not exist "%sourceFile%" (
    echo Source file "%sourceFile%" not found.
    exit /b
)

if not exist "%backupFile%" (
    type nul > "%backupFile%"
)

echo Filtering .org names from %sourceFile%...

(
    set "lineNumber=0"
    for /f "usebackq delims=" %%a in ("%sourceFile%") do (
        set /a "lineNumber+=1"
        set "line=%%a"
        echo !line! | find ".org" > nul
        if not errorlevel 1 (
            find "!line!" "%backupFile%" > nul
            if errorlevel 1 (
                echo !lineNumber! !line! >> "%backupFile%"
            )
        )
    )
) > nul

echo Filtered .org names with line numbers backed up to %backupFile%.

endlocal
