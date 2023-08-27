@echo off
setlocal enabledelayedexpansion

set "inputFolder=test2"
set "outputFolder=test1"

set "rawFileExtension=org"
set "backupFileExtension=txt"

if not exist "%outputFolder%" mkdir "%outputFolder%"

for %%A in ("%inputFolder%\*.%rawFileExtension%") do (
    set "inputFile=%%A"
    set "outputFile=%outputFolder%\%%~nA.%backupFileExtension%"
    
    (
        for /f "usebackq delims=" %%B in ("!inputFile!") do (
            set "line=%%B"
            if "!line:~0,3!"=="## " (
                echo * !line:~3!
            ) else (
                echo !line!
            )
        )
    ) > "!outputFile!"
)

rd /s /q "%inputFolder%"

endlocal