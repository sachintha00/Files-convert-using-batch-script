@echo off
setlocal enabledelayedexpansion

set "inputFile=*.txt"
set "outputFile=*.org"

del %outputFile% 2>nul

for %%A in (%inputFile%) do (
    set "inputFile=%%A"
    set "outputFile=%%~nA.org"
    
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

endlocal