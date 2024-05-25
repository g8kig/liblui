setlocal
set CURDIR=%cd%

cd %CURDIR%\libui-ng
rd /s/q build
cd %CURDIR%\lua-5.4.6
rd /s/q build
cd %CURDIR%\lua-5.4.7
rd /s/q build
cd %CURDIR%\lui
rd /s/q build

