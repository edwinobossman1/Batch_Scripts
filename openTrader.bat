@echo off
ECHO Script para abrir TradinView, 
ECHO Tambien abrira los repositorios y herramientas necesarias

setlocal
:PROMPT
SET /P AREYOUSURE=Lo ejecuto? (S/[N])?
IF /I "%AREYOUSURE%" NEQ "S" GOTO END

SET BROWSER=firefox.exe
SET WAIT_TIME=2
START %BROWSER% https://www.tradingview.com/ https://www.tradingview.com/heatmap/crypto/ https://coinmarketcap.com/ https://cryptobubbles.net/ https://www.binance.com/

REM This will open folders
%SystemRoot%\explorer.exe "C:\repos"

REM This will execute programs
rem start /d "C:\Program Files\Git" git-bash.exe

rem start /d "C:\Program Files (x86)\Google\Chrome\Application" chrome.exe 
rem start microsoft-edge:https://devsource.herokuapp.com/

:END
endlocal