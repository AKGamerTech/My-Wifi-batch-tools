
echo off
cls

netsh wlan show profile

set /p NAME= Input WiFi Name here: 

cls

netsh wlan connect name="%NAME%"