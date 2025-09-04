ECHO Off 

echo Este comando va a reiniciar todos los servicios de red. Continuar? 
pause>nul
ipconfig.exe /release *
net.exe stop "dhcp client" 
net.exe stop "dns client" 
net.exe stop "network connections" 
net.exe start "dhcp client" 
net.exe start "dns client" 
net.exe start "network connections" 
ipconfig.exe /flushdns 
ipconfig.exe /renew *

IPConfig /all>C:\IP_Info.txt
Notepad.exe C:\IP_Info.txt

msg * Hecho, revisa el informe IP_Info.txt en la raiz en C. 
