@ECHO OFF
SET CWD=%~dp0
ECHO.
ECHO ====================================
ECHO Script to install Micro-Agent 
ECHO Run it as Administrator 
ECHO ====================================


REM Uninstall Existing Winlogbeat623
:RemoveExisting
IF EXIST "C:\Program Files\winlogbeat623" (
	sc queryex "winlogbeat"|Find "STATE"|Find /v "RUNNING">NULL
		echo [+] Service is running..
		echo [-] Stopping service..
		net stop "winlogbeat">NULL
		echo [-] Remove service winlogbeat and related folders
		sc delete "winlogbeat"
		rmdir /s /q "C:\Program Files\winlogbeat623"
		ping localhost -n 4 >NULL		
		GOTO PrepareInstall
)
   

:CheckExisting
IF EXIST "C:\Program Files\winlogbeat" (
	sc queryex "winlogbeat"|Find "winlogbeat" > NULL 
	if ERRORLEVEL == 1 (
		echo [+] Service is not Installed, Installing...
		GOTO Install
		GOTO EOF	
	) else (
		sc queryex "winlogbeat"|Find "STATE"|Find "RUNNING">NULL
		echo [+] Service is available, Starting Service..		
		GOTO StartService 
	)
)


REM XCOPY command Arguments with Network Share Path
:PrepareInstall
IF NOT EXIST "C:\Program Files\winlogbeat" (
echo [+] Preparing Setup...
xcopy /E /I /Y "%~dp0\winlogbeat" "C:\Program Files\Winlogbeat\"
GOTO Install
)

:Install
echo [*] Installing Winlogbeat service
cd C:\Program Files\Winlogbeat\
powershell -ep bypass ./install-service-winlogbeat.ps1
cd %CWD%
GOTO StartService


:StartService
net start winlogbeat >NULL
ping localhost -n 2 >NULL	
GOTO EOF
:EOF



