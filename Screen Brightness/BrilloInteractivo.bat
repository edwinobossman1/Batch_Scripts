@echo off
set /p brillo=Ingresa nivel de brillo (0-100): 
powershell (Get-WmiObject -Namespace root/WMI -Class WmiMonitorBrightnessMethods).WmiSetBrightness(1,%brillo%)
echo Brillo ajustado a %brillo% %%
pause
