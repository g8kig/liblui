setlocal
set CURDIR=%cd%
rd /s/q %CURDIR%\run
mkdir %CURDIR%\run

cd %CURDIR%\lua-5.4.6
copy build\liblua54.dll %CURDIR%\run
copy build\lua.exe %CURDIR%\run
cd %CURDIR%\lui
copy build\liblui.dll %CURDIR%\run
xcopy /s/y/q samples\* %CURDIR%\run


