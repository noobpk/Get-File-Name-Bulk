@echo off
cd /d "%~dp0" && ( if exist "%temp%\getfilename.vbs" del "%temp%\getfilename.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  cmd /u /c echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && ""%~s0""", "", "runas", 1 >> "%temp%\getfilename.vbs" && "%temp%\getfilename.vbs" && exit /B )
mode con cols=90 lines=18
title Tool Get FileName Bulk
::===========================================================================
setlocal enabledelayedexpansion
setlocal EnableExtensions
pushd "%~dp0"
cd /d "%~dp0"
:MAINMENU
echo. [94m[+]__author__: @noobpk[0m
echo. [94m[+]__version__: 1.0[0m
echo. [94m[+]__download + update__: https://github.com/noobpk/Get-File-Name-Bulk[0m
echo. :=======================================================:
echo.
Echo.     [92m[1] Get filename - Support image extension ( *.jpg, *.png, *.bmp, *.gif, *jpge )[0m
Echo.
Echo.     [93m[^^!2] Update soon ^^!^^![0m
echo. 
Echo.     [93m[^^!3] Update soon ^^!^^![0m
Echo.
echo. :=======================================================:
choice /C:123 /N /M "[+] Enter Your Choice [1,2,3] : "
if errorlevel 3 goto :updatesoon
if errorlevel 2 goto :updatesoon
if errorlevel 1 goto :checkfile
::===========================================================================
:updatesoon
echo. [93m[^^!]Check update for this function at https://github.com/noobpk/Get-File-Name-Bulk[0m
echo. [96m[^>]Press any key to continue...[0m
pause > nul
CLS
GOTO MAINMENU
::===========================================================================
:checkfile
if not exist *.jpg if not exist *.png if not exist *.bpm if not exist *.gif if not exist *.jpge (goto :filenotfound) else (goto :filefound)	
if exist "output.txt" del "output.txt"
::===========================================================================
:filefound
rem dir /b *.jpg *.png *.bmp *.gif *jpge >output.txt
powershell -Com (ls *.jpg,*.png,*.bmp,*.gif,*jpge -File).BaseName > output.txt 
echo. [92m[^>]Success - Check in file output.txt ^^!^^![0m
echo. [96m[^>]Press any key to exit...[0m
pause > nul
echo. [Thanks for using ^^^^]
TIMEOUT /T 1 /nobreak > nul
CLS
exit
::===========================================================================
:filenotfound
echo. [91m[x]Fail - Not found extension support in folder ^^!^^![0m
echo. [92m[^>]Extension support: *.jpg, *.png, *.bmp, *.gif, *jpge[0m
echo. [96m[^>]Press any key to exit...[0m
pause > nul
echo. [Thanks for using ^^^^]
TIMEOUT /T 1 /nobreak > nul
CLS
exit
::===========================================================================