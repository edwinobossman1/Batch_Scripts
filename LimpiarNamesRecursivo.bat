@echo off
setlocal enabledelayedexpansion

REM Recorremos todos los archivos de esta carpeta y subcarpetas
for /r %%F in (*) do (
    set "fullpath=%%F"
    set "name=%%~nxF"
    set "folder=%%~dpF"
    set "new="

    REM Recorremos caracter por caracter el nombre
    for /l %%i in (0,1,255) do (
        set "ch=!name:~%%i,1!"
        if "!ch!"=="" goto renamefile

        REM Solo dejamos letras, números, guion y guion bajo
        echo !ch!| findstr /r "^[A-Za-z0-9_-]$" >nul
        if not errorlevel 1 (
            set "new=!new!!ch!"
        )
    )

    :renamefile
    if not "!name!"=="!new!" (
        echo Renombrando: "!name!" → "!new!"
        ren "%%F" "!new!" >nul 2>&1
    )
)

endlocal
pause
