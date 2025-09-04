ECHO Script para abrir TradinView, 
ECHO This batch script will open the following apps:File Explorer(repos), Visual Studio Code, Git Bash(~), 
ECHO system files (.bash_profile, .bashrc) are located in C:\Users\Ari\

REM commands below will open new window for firefox browser; an alternative way to above
SET BROWSER=firefox.exe
SET WAIT_TIME=2
START %BROWSER% -new-window https://asana.com/, https://github.com/ar-to


setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END

REM This will execute programs
start /d "C:\Program Files (x86)\Microsoft VS Code" Code.exe
start /d "C:\Program Files\Git" git-bash.exe
REM the following command "C:\Program Files (x86)\Microsoft VS Code/Code.exe" below runs the app on the cmd.exe but stops the next command when used in batch; so the above syntax is prefered to avoid this in batch

REM This will open folders
%SystemRoot%\explorer.exe "D:\repos"

REM This will open URLs
start /d "C:\Program Files (x86)\Google\Chrome\Application" chrome.exe http://philosophyanddesign.com https://ehspook.com
start microsoft-edge:https://github.com/ar-to
start microsoft-edge:https://slack.com/
start microsoft-edge:https://gitter.im/
start microsoft-edge:https://devsource.herokuapp.com/

REM optional
REM start microsoft-edge:https://www.dropbox.com/

:END
endlocal