set -e
pushd ./libui-ng
[ -d ./build ] && rm -r ./build
popd
pushd ./lua-5.4.6
[ -d ./build ] && rm -r ./build
popd
pushd ./lui
[ -d ./build ] && rm -r ./build
popd

