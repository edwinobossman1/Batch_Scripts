@ECHO OFF
CLS
SET "currentPath=%cd%"

setlocal EnableDelayedExpansion

IF NOT EXIST "Videos\" mkdir Videos
IF NOT EXIST "Imagenes\" mkdir Imagenes

MOVE "%currentPath%\*.mp4" "%currentPath%\Videos"
MOVE "%currentPath%\*.MP4" "%currentPath%\Videos"
MOVE "%currentPath%\*.mov" "%currentPath%\Videos"
MOVE "%currentPath%\*.MOV" "%currentPath%\Videos"
MOVE "%currentPath%\*.M4V" "%currentPath%\Videos"

MOVE "%currentPath%\*.jpg" "%currentPath%\Imagenes"
MOVE "%currentPath%\*.JPG" "%currentPath%\Imagenes"
MOVE "%currentPath%\*.jpeg" "%currentPath%\Imagenes"
MOVE "%currentPath%\*.JPEG" "%currentPath%\Imagenes"
MOVE "%currentPath%\*.png" "%currentPath%\Imagenes"
MOVE "%currentPath%\*.PNG" "%currentPath%\Imagenes"
MOVE "%currentPath%\*.HEIC" "%currentPath%\Imagenes"
MOVE "%currentPath%\*.gif" "%currentPath%\Imagenes"
MOVE "%currentPath%\*.GIF" "%currentPath%\Imagenes"

EXIT