::@echo off
::setlocal enabledelayedexpansion

::@Echo off
::Echo � ����� %~dp0 �饬 dt-䠩��
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
::rem ����� �����筮 ���⮣� ���७��:
::>"D:\1.txt" echo %n%
::for /l %%i in (1,1,9) do (
:: rem ��� ��६�����, �ᯮ��㥬�� �������� "set /a", ᨬ���� ���७�� � ������� "call" ����� �� �ਬ�����:
:: set /a n+=10
:: rem � ��� ����� ����室��� �ᯮ�짮���� ������� ���७��:
:: >>"D:\1.txt" call echo %%n%%
::)

::for %%I in do (
::set /a Nom+=1
::"C:\Program Files\1cv8\common\1cestart.exe" CREATEINFOBASE File="%%~nI"; /AddInList "%Nom%_%%~nI" /UseTemplate "%%I"
::)




