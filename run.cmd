setlocal
set CURDIR=%cd%
rd /s/q %CURDIR%\run
mkdir %CURDIR%\run

cd %CURDIR%\lua-5.5.0
copy build\liblua55.dll %CURDIR%\run
copy build\lua.exe %CURDIR%\run
cd %CURDIR%\lui
copy build\liblui.dll %CURDIR%\run
xcopy /s/y/q samples\* %CURDIR%\run


