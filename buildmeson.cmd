setlocal
set CURDIR=%cd%

cd %CURDIR%\libui-ng
rd /s/q build
mkdir build
meson setup build --buildtype=release --default-library=static --layout=mirror
if NOT ["%errorlevel%"]==["0"] (
    exit /b %errorlevel%
)
ninja -C build
if NOT ["%errorlevel%"]==["0"] (
    exit /b %errorlevel%
)

cd %CURDIR%\lua-5.5.0
rd /s/q build
mkdir build
cmake -G"Ninja" -DCMAKE_BUILD_TYPE=Release  -S . -B ./build
if NOT ["%errorlevel%"]==["0"] (
    exit /b %errorlevel%
)
ninja -C build
if NOT ["%errorlevel%"]==["0"] (
    exit /b %errorlevel%
)

IF exist %CURDIR%\libui-ng\build (
    copy /b "%CURDIR%\libui-ng\build\libui.a" "%CURDIR%\libui-ng\build\libui.lib"
)

cd %CURDIR%\lui
rd /s/q build
mkdir build
if NOT ["%errorlevel%"]==["0"] (
    exit /b %errorlevel%
)
cmake -G"Ninja" -DCMAKE_BUILD_TYPE=Release -S . -B ./build
ninja -C build
