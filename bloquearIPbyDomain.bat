set ip=%1
netsh advfirewall firewall add rule name="BLOCK IP ADDRESS - %ip%" dir=in action=block remoteip=%ip%
netsh advfirewall firewall add rule name="BLOCK IP ADDRESS - %ip%" dir=out action=block remoteip=%ip%

then from an administrative Command line execute block.bat 192.168.0.1 or whatever IP address you want to block This doesn't redirect to 127.0.0.1, just blocks it.
