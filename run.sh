set -e
rm -rf ./run
mkdir ./run
cp lui/build/liblui.so ./run
cp lua-5.4.4/build/lua ./run
cp lua-5.4.4/build/liblua54.so ./run
cp -r lui/samples/* ./run
cd ./run
strip ./lua
strip ./liblui.so
strip ./liblua54.so
./lua ./controls.lua

