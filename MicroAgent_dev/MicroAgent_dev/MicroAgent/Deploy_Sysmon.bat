@ECHO OFF
SET CWD=%~dp0
ECHO.
ECHO ====================================
ECHO Script to install Sysmon
ECHO Run it as Administrator 
ECHO ====================================

:RemoveOld
IF EXIST "C:\Program Files\Sysmon" (rmdir /s /q "c:\Program Files\Sysmon")
IF EXIST "C:\Program Files (x86)\Sysmon" (rmdir /s /q "C:\Program Files (x86)\Sysmon")


REM Update XCOPY command Arguments with Network Share Path
IF NOT EXIST "C:\Program Files\sysmon" (xcopy /E /I /Y "%~dp0\Sysmon" "C:\Program Files\Sysmon")


IF NOT EXIST "C:\Windows\Sysmon.exe" GOTO Install
IF EXIST "C:\Windows\Sysmon.exe" GOTO UninstallService
IF NOT EXIST "C:\Windows\Sysmon64.exe" GOTO Install
IF EXIST "C:\Windows\Sysmon64.exe" GOTO UninstallService


:CheckService
sc query "Sysmon" | Find "RUNNING" > NULL 
If ERRORLEVEL == 0 ( goto UninstallService )
sc query "Sysmon64" | Find "RUNNING"
If ERRORLEVEL == 0 ( goto UninstallService )


:UninstallService
C:\Windows\sysmon.exe -u force
C:\Windows\sysmon64.exe -u force
GOTO Install


:Install
"C:\Program Files\sysmon\sysmon.exe" -accepteula -i
"C:\Program Files\sysmon\sysmon.exe" -c "C:\Program Files\sysmon\blu_sysmon.xml"
ping -n 4 localhost
net start Sysmon
net start Sysmon64
GOTO EOF
:EOF
