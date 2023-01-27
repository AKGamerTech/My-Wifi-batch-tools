@echo off
echo.
netsh wlan show profile
echo.
echo.
echo Is the wifi listed in this list?
set /p list= (Y/N) 

if "%list%" == "Y" goto y

if "%list%" == "y" ( goto y
	) else (
		goto :n
		)

:n
echo You need to connect manually to a WiFi to use this scipt
pause
exit

:y
cls
netsh wlan show profile
echo What's the name of the wifi that you want to connect?
set /p wifi= 

cls
echo Do you want do specify a interface ?
set /p interfaceyn= (Y/N) 

if "%interfaceyn%" == "Y" goto interface

if "%interfaceyn%" == "y" ( goto interface
	) else (
		goto :fin
		)
:interface
cls
netsh wlan show interfaces
echo what interface do you want to use?
set /p interfaceq= 
goto fin

:fin
echo Export the script to copy manually or copy automatically? (m / a)
set /p do= 

if "%do%" == "m" (	goto :m 
) else (
		goto :a
)

:m
if "%interfaceyn%" == "y" ( echo netsh wlan connect name="%wifi%" interface="%interfaceq%" >> script.bat
	) else (
		if "%interfaceyn%" == "Y" ( echo netsh wlan connect name="%wifi%" interface="%interfaceq%" >> script.bat
		) else (
				echo netsh wlan connect name="%wifi%" >> script.bat
			)
		)

goto :end_m
:a
echo Wait...
if "%interfaceyn%" == "y" ( echo netsh wlan connect name="%wifi%" interface="%interfaceq%" >> script.bat
	) else (
		if "%interfaceyn%" == "Y" ( echo netsh wlan connect name="%wifi%" interface="%interfaceq%" >> script.bat
		) else (
				echo netsh wlan connect name="%wifi%" >> script.bat
			)
		)
move script.bat "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup"
goto :end_a

:end_m
echo Script end
echo your file is here :
cd
echo And you will need to copy it here: 
echo %AppData%\Microsoft\Windows\Start Menu\Programs\Startup
pause
exit

:end_a
echo Script end
echo your file is here:
echo "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup"
pause
exit