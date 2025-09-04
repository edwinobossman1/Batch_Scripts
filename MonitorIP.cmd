@ECHO OFF
mode con cols=70 lines=9
ipconfig /all|FINDSTR /C:"Nombre de host"
ipconfig|FINDSTR  "Dirección IPv4"
ipconfig|FINDSTR /C:"Máscara de subred"
ipconfig /all|FINDSTR /C:"Servidores DNS"
netstat -r|FINDSTR /C:"Dirección de puerta de enlace"
netsh dump
PAUSE>NUL