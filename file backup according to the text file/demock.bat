@echo off
set "fileList=text.txt"
set "sourceFolder=backup"
set "destinationFolder=tuk"

for /f "usebackq delims=" %%i in ("%fileList%") do (
    set "filename=%%~ni"
    set "extension=%%~xi"
    if /i "%%~xi"==".org" (
        @REM echo %%i
         copy "%sourceFolder%\%%i" "%destinationFolder%\"
    )
)

endlocal


