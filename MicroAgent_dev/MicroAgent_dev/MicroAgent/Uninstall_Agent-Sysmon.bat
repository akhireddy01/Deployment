@ECHO OFF
SET CWD=%~dp0
ECHO.
ECHO ====================================
ECHO Script to Uninstall Micro-Agent and Sysmon
ECHO Run it as Administrator
ECHO ====================================


REM Uninstall Existing Winlogbeat
:UninstallWinlogbeat
IF EXIST "C:\Program Files\winlogbeat" (
	sc queryex "winlogbeat"|Find "STATE"|Find /v "RUNNING">NULL
		echo [+] Service is running..
		echo [-] Stopping service..
		net stop "winlogbeat"
		echo [-] Remove service winlogbeat and related folders
		sc delete "winlogbeat"
		ping localhost -n 10
		rmdir /s /q "C:\Program Files\winlogbeat"
)


REM Uninstall Existing Sysmon
:UninstallSysmon
IF EXIST "C:\Windows\Sysmon.exe" (
	sc queryex "Sysmon"|Find "STATE"|Find /v "RUNNING">NULL
	echo [+] Sysmon is running..
	echo [-] Stopping service..
	net stop "Sysmon"
	echo [+] Uninstalling Sysmon..
	C:\Windows\Sysmon.exe -u force
	ping localhost -n 5 | find "Reply" > NULL
	del /F /Q C:\Windows\Sysmon.exe
	rmdir /s /q "C:\Program Files\sysmon"
)
IF EXIST "C:\Windows\Sysmon64.exe" (
	sc queryex "Sysmon64"|Find "STATE"|Find /v "RUNNING">NULL
	echo [+] Sysmon64 is running..
	echo [-] Stopping service..
	net stop "Sysmon64"
	echo [+] Uninstalling Sysmon64..
	C:\Windows\sysmon64.exe -u force
	ping localhost -n 5 | find "Reply" > NULL
	del /F /Q C:\Windows\Sysmon64.exe
	rmdir /s /q "C:\Program Files\sysmon"
)

:EOF
