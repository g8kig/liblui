set -e
[ -d ./run ] && rm -r ./run
mkdir ./run
cp lui/build/liblui.dylib ./run
cp lua-5.4.6/build/lua ./run
cp lua-5.4.6/build/liblua54.dylib ./run
cp -r lui/samples/* ./run
pushd ./run
./lua ./controls.lua
popd

