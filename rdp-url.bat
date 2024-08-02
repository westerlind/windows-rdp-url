@echo off
setlocal EnableDelayedExpansion

REM Extract the address we will connect to
set "arg=%1"
set "address=%arg:rdp://=%"
set "address=!address:"=!"
set "address=!address:/=!"

REM Prepare temporary RDP file name
set "filename=%address%"
for %%A in (\ : ^< ^> ^|) do (
   set "filename=!filename:%%A=_!"
)

REM Remove previous temporary RDP file if it exists
if exist "%rdpfile%" del "%rdpfile%"

REM Create temporary RDP file
set "rdpfile=%TEMP%\%filename%.rdp"
echo full address:s:%address% > "%rdpfile%"
echo use multimon:i:0 >> "%rdpfile%"
echo span monitors:i:0 >> "%rdpfile%"
echo selectedmonitors:s:0 >> "%rdpfile%"

REM Launch the RDP file with the associated application
start "" "%rdpfile%"

endlocal