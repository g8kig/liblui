#! /bin/bash
set -e
# list of requirements for Linux
# sudo apt update && sudo apt install -y build-essential gcc libgtk-3-dev meson ninja-build cmake libreadline-dev
[ -d ./run ] && rm -r ./run
mkdir ./run
cp lui/build/liblui.so ./run
cp lua-5.5.0/build/lua ./run
cp lua-5.5.0/build/liblua55.so ./run
cp -r lui/samples/* ./run
pushd ./run
strip ./lua
strip ./liblui.so
strip ./liblua55.so
./lua ./controls.lua
popd

