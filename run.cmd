setlocal
set CURDIR=%cd%
rd /s/q %CURDIR%\run
mkdir %CURDIR%\run

cd %CURDIR%\libui-ng
copy build\libui.dll %CURDIR%\run
cd %CURDIR%\lua-5.5.1
copy build\lua55.dll %CURDIR%\run
copy build\lua.exe %CURDIR%\run
cd %CURDIR%\lui
copy build\lui.dll %CURDIR%\run\liblui.dll
xcopy /s/y/q samples\* %CURDIR%\run

cd %CURDIR%\run
lua controls.lua
lua simple-sample.lua

cd %CURDIR%
