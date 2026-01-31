set -e
pushd ./libui-ng
[ -d ./build ] && rm -r ./build
mkdir ./build
meson setup build --buildtype=release --default-library=shared --layout=mirror
ninja -C ./build
popd
pushd ./lua-5.5.0
[ -d ./build ] && rm -r ./build
mkdir ./build
cmake -G"Ninja" -DCMAKE_BUILD_TYPE=Release  -S . -B ./build
ninja -C ./build
popd
pushd ./lui
[ -d ./build ] && rm -r ./build
mkdir ./build
cmake -G"Ninja" -DCMAKE_BUILD_TYPE=Release -S . -B ./build
ninja -C ./build
popd

