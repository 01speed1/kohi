REM Build script for testbed
@ECHO OFF
SetLocal EnableDelayedExpansion

REM Get a list of all the .c files.
SET cFilenames=
FOR /R %%f in (*.c) do (
    SET cFilenames=!cFilenames! %%f
)

ECHO "Files to compile:" %cFilenames%

SET assembly=testbed
SET compilerFlags=-g
REM -Wall -Werror -v
SET includeFlags=-I. -I../../engine/src
SET linkerFlags=-L../../bin/ -lengine.lib
SET defines=-D_DEBUG -DKIMPORT

ECHO "Building %assembly%..."
ECHO "Command: C:\Program Files\LLVM\bin\clang.exe" %cFilenames% %compilerFlags% -o ../../bin/%assembly%.exe %defines% %includeFlags% %linkerFlags%

"C:\Program Files\LLVM\bin\clang.exe" %cFilenames% %compilerFlags% -o ../../bin/%assembly%.exe %defines% %includeFlags% %linkerFlags%
IF %ERRORLEVEL% NEQ 0 (
    ECHO "Error al compilar el testbed. Código: %ERRORLEVEL%"
)