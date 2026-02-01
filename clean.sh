#! /bin/bash
set -e
pushd ./libui-ng
[ -d ./build ] && rm -r ./build
popd
pushd ./lua-5.4.6
[ -d ./build ] && rm -r ./build
popd
pushd ./lua-5.4.7
[ -d ./build ] && rm -r ./build
popd
pushd ./lua-5.5.0
[ -d ./build ] && rm -r ./build
popd
pushd ./lui
[ -d ./build ] && rm -r ./build
popd

