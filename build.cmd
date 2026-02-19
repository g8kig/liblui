setlocal
set CURDIR=%cd%

cd %CURDIR%\libui-ng
rd /s/q build
mkdir build
if NOT ["%errorlevel%"]==["0"] (
    exit /b %errorlevel%
)
cmake -G"Ninja" -DCMAKE_BUILD_TYPE=Release -S . -B ./build
ninja -C build

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

cd %CURDIR%\lui
rd /s/q build
mkdir build
if NOT ["%errorlevel%"]==["0"] (
    exit /b %errorlevel%
)
cmake -G"Ninja" -DCMAKE_BUILD_TYPE=Release -S . -B ./build
ninja -C build
