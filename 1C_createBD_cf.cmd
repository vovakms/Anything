::@echo off
::setlocal enabledelayedexpansion

::@Echo off
::Echo В папке %~dp0 ищем dt-файлы
::Dir /B /A:-D %~dp0*.dt
::Pause

::@echo off && cls
::cd c:\temp\22\
::dir /b >filelist.txt
::for %%I IN (filelist.txt) DO mkdir %%~nI
::Pause

::FOR %%I IN (*.dt) DO mkdir "%%~nI" & move "%%I" "%%~nI"
set Nom=0
set /a NNN=1
FOR %%I IN (*.cf) DO (
set /a Nom+=1
"C:\Program Files\1cv8\common\1cestart.exe" CREATEINFOBASE File="%%~nI"; /AddInList "%Nom% %%~nI" /UseTemplate "%%I"
)

::set n=0
::rem Здесь достаточно простого расширения:
::>"D:\1.txt" echo %n%
::for /l %%i in (1,1,9) do (
:: rem Для переменных, используемых командой "set /a", символы расширения и команду "call" можно не применять:
:: set /a n+=10
:: rem А вот здесь необходимо использовать двойное расширение:
:: >>"D:\1.txt" call echo %%n%%
::)

::for %%I in do (
::set /a Nom+=1
::"C:\Program Files\1cv8\common\1cestart.exe" CREATEINFOBASE File="%%~nI"; /AddInList "%Nom%_%%~nI" /UseTemplate "%%I"
::)




