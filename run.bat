@echo off

if not exist "%TEMP%\JohnStuff" mkdir "%TEMP%\JohnStuff"

"%~dp0chromelevator.exe" --kill -o "%TEMP%\JohnStuff\happytreeWebhook" all
