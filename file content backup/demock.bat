@echo off
setlocal enabledelayedexpansion

set "filename=backup.txt"

set "counter=0"
for /f "tokens=2" %%a in (backup.txt) do (
    set /a "counter+=1"
    set "word[!counter!]=%%a"
)

for /l %%i in (1,1,%counter%) do (
    set "wordToSearch=!word[%%i]!"
    findstr /i /c:"!wordToSearch!" input.txt > nul
    if errorlevel 1 (
        echo !wordToSearch! not found in input.txt
        for /f "tokens=1,*" %%a in (%filename%) do (
            set "number=%%a"
            set "domain=%%b"
            set "domain=!domain: =!"

            @REM echo Number: !number!
            @REM echo Domain: !domain!
        )
        if "%wordToSearch%"=="%Domain%" (
            echo !number!
        )
    ) else (
        echo !wordToSearch!
    )
)

endlocal
pause