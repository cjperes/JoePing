:: Acrescentar tratamento de erro :exit



@echo off
title JoePing - joedev.com.br
color 0F
Setlocal EnableExtensions 
mode 80,10

:ini
cls
set /p server=Digite o servidor:
if not defined server goto erro
cls
goto resultado

:erro
cls
color 0C
echo Especifique um servidor para prosseguir!
echo.
ping -n 3 127.0.0.1>nul
cls
color 0F
set /p server=Digite o servidor:
if not defined server goto erro

:resultado
cls
Title Carregando...
echo Aguarde! Esse processo costuma ser rapido!
call :obterPing ping
cls
Title JoePing - joedev.com.br
echo Ping: %ping%
echo JoePing :: %date% %time% >> log.txt
echo %server% :: %ping% >> log.txt
echo ================ >> log.txt
echo Realizar outro Ping? (y/n)
set /p new=^>
rem /i faz deixar de ser casesensitive
if not defined new goto exit
IF /i "%new%"=="y" goto:ini
IF /i "%new%"=="n" goto:exit

:exit
cls
title JoePing ;D
echo Obrigado! joedev.com.br and bbcreative.org
ping -n 3 127.0.0.1>nul
exit


:obterPing
set var_name=%~1
set %var_name%=Erro! Não foi possível completar o Ping.
set comando_ping=Ping %server%  -n 5

for /f "tokens=* delims=*" %%a in ('%comando_ping%') do (set "a=%%a")
   :obterPing_loop
      set "a=%a:~1%"
      echo.%a%|find "=" >nul
   if %errorlevel%==0 goto obterPing_loop

set %var_name%=%a:~1%
