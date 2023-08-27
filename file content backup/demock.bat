@echo off
setlocal enabledelayedexpansion

set "sourceFile=input.txt"
set "backupFile=org_names_backup.txt"

if not exist "%sourceFile%" (
    echo Source file "%sourceFile%" not found.
    exit /b
)

if not exist "%backupFile%" (
    echo Backup file "%backupFile%" not found.
    exit /b
)

echo Checking and copying missing .org names from %backupFile% to %sourceFile%...

for /f "usebackq delims=" %%a in ("%backupFile%") do (
    set "orgName=%%a"
    findstr /i "!orgName!" "%sourceFile%" > nul
    if errorlevel 1 (
        echo !orgName! >> "%sourceFile%"
    )
)

echo Checked and copied missing .org names.

endlocal
