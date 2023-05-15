set -e
[ -d ./run ] && rm -r ./run
mkdir ./run
cp lui/build/liblui.so ./run
cp lua-5.4.6/build/lua ./run
cp lua-5.4.6/build/liblua54.so ./run
cp -r lui/samples/* ./run
pushd ./run
strip ./lua
strip ./liblui.so
strip ./liblua54.so
./lua ./controls.lua
popd

