# libui

libui is a simple and portable C library for building graphical user interfaces.

## Building with CMake

To build libui with CMake:

```bash
mkdir build
cd build
cmake ..
make
```

### Options

- `BUILD_SHARED_LIBS` (default: ON) - Build shared libraries
- `BUILD_TESTS` (default: OFF) - Build tests (excluded from this CMake project)
- `BUILD_EXAMPLES` (default: OFF) - Build examples (excluded from this CMake project)

### Platform-specific notes

#### Windows
- Uses Visual Studio or MinGW
- Requires Windows SDK

#### macOS
- Uses Cocoa framework
- Requires Xcode command line tools

#### Linux
- Uses X11
- Requires X11 development libraries

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
