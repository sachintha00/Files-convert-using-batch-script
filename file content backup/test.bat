@REM @echo off
@REM setlocal enabledelayedexpansion

@REM set "filename=backup.txt"

@REM for /f "tokens=1,*" %%a in (%filename%) do (
@REM     set "number=%%a"
@REM     set "domain=%%b"
@REM     set "domain=!domain: =!"

@REM     echo Number: !number!
@REM     echo Domain: !domain!
@REM )

@REM endlocal
@REM pause










filter and selecting row and replce

@REM @echo off
@REM setlocal enabledelayedexpansion

@REM set "filename=backup.txt"

@REM set "counter=0"
@REM for /f "tokens=2" %%a in (backup.txt) do (
@REM     set /a "counter+=1"
@REM     set "word[!counter!]=%%a"
@REM )

@REM for /l %%i in (1,1,%counter%) do (
@REM     set "wordToSearch=!word[%%i]!"
@REM     findstr /i /c:"!wordToSearch!" input.txt > nul
@REM     if errorlevel 1 (
@REM         echo !wordToSearch! not found in input.txt
@REM         for /f "tokens=1,*" %%a in (%filename%) do (
@REM             set "number=%%a"
@REM             set "domain=%%b"
@REM             set "domain=!domain: =!"

@REM             @REM echo Number: !number!
@REM             @REM echo Domain: !domain!
@REM         )
@REM         if "%wordToSearch%"=="%Domain%" (
@REM             echo !number!
@REM         )
@REM     ) else (
@REM         echo !wordToSearch!
@REM     )
@REM )

@REM endlocal
@REM pause
