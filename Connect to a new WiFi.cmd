:start
echo off
color a
cls
echo Saved networks: 

netsh wlan show profile

pause
echo.
echo Avaible Networks: 
echo.
echo List all networks (a)
echo.
echo List only networks that are currently in range (b) 
echo.
echo Enter a or b:


set /p choice=
if "%choice%" == "a" goto :a
if "%choice%" == "b" goto :b
echo Invalid choice. Try again.
goto :start


:a
echo You chose a.
netsh wlan show networks

goto :0

:b
echo You chose b.
netsh wlan show networks mode=bssid
goto :0



:0
set /p NAME= Input WiFi Name here: 

set /p KEY= Input WiFi Password here:

cls

netsh wlan connect name="%NAME%" ssid="%NAME%" key="%KEY%"

cls

@echo off
:loop
set a=0
set /a a=a+1
if %a% == "2" goto :end 
echo Wait.
timeout /t 1 > nul
echo Wait..
timeout /t 1 > nul
echo Wait...
timeout /t 1 > nul
goto :loop


echo Wait...

:end

netsh wlan show interfaces
echo.
echo End of script.
pause
exit


