@echo off
setlocal enabledelayedexpansion

set "sourceFile=mock.txt"
set "backupFile=mock_backup.txt"

if not exist "%sourceFile%" (
    echo Source file "%sourceFile%" not found.
    exit /b
)

echo Filtering .org names from %sourceFile%...

(
    for /f "usebackq delims=" %%a in ("%sourceFile%") do (
        set "line=%%a"
        echo !line! | find ".org" > nul
        if not errorlevel 1 (
            echo !line! >> "%backupFile%"
        )
    )
) > nul

echo Filtered .org names backed up to %backupFile%.

endlocal
