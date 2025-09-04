@echo off
setlocal enabledelayedexpansion

REM Recorremos todos los archivos de la carpeta actual
for %%F in (*) do (
    set "old=%%F"
    set "new="

    REM Recorremos caracter por caracter
    for /l %%i in (0,1,255) do (
        set "ch=!old:~%%i,1!"
        if "!ch!"=="" goto renamefile

        REM Si el caracter es válido, lo agregamos a la nueva cadena
        echo !ch!| findstr /r "^[A-Za-z0-9_-]$" >nul
        if not errorlevel 1 (
            set "new=!new!!ch!"
        )
    )

    :renamefile
    if not "!old!"=="!new!" (
        echo Renombrando: "!old!" → "!new!"
        ren "%%F" "!new!"
    )
)

endlocal
pause
