@ECHO OFF
CLS

setlocal EnableDelayedExpansion

taskkill /F /IM MySQLInstallerConsole.exe
taskkill /F /IM AdobeARM.exe

msg * BRO, PROCESOS ELIMINADOS: "MySQLInstallerConsole y AdobeARM"

EXIT