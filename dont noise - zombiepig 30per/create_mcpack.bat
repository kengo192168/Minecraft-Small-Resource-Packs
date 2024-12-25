@echo off
setlocal enabledelayedexpansion

:: Get current date and time in YYMMdd_HHmm format
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value') do set datetime=%%I
set timestamp=%datetime:~2,6%_%datetime:~8,4%

:: Get the name of the pack from the directory name
for %%F in ("%~dp0.") do set fileName=%%~nF


set packName=%~dp0..\%timestamp% %fileName%.mcpack
powershell -Command "Compress-Archive -Path '%~dp0\*' -DestinationPath '!packName!.zip'"

move "%packName%.zip" "%packName%"
echo %packName%
