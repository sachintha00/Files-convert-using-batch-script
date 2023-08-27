@echo off
set "fileList=domains.txt"
set "sourceFolder=sourceFolder"
set "backupFolder=backup"

if not exist "%backupFolder%" mkdir "%backupFolder%"

for /f "usebackq delims=" %%i in ("%fileList%") do (
    set "filename=%%~ni"
    set "extension=%%~xi"
    if /i "%%~xi"==".org" (
        @REM echo %%i
         copy "%sourceFolder%\%%i" "%backupFolder%\"
    )
)

endlocal


