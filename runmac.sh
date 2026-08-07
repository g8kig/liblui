set -e
[ -d ./run ] && rm -r ./run
mkdir ./run
cp lui/build/liblui.dylib ./run
cp lua-5.5.1/build/lua ./run
cp lua-5.5.1/build/liblua55.dylib ./run
cp -r lui/samples/* ./run
pushd ./run
./lua ./controls.lua
./lua ./simple-sample.lua
popd

