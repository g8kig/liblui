# CMake Project Structure

This CMake project is a direct translation of the original Meson project structure, excluding tests and examples as requested.

## Files and Directories

### Main Files
- `CMakeLists.txt` - Main CMake configuration file
- `README.md` - Project documentation
- `build.sh` - Simple build script

### CMake Configuration
- `cmake/toolchain.cmake` - Toolchain configuration for cross-compilation

### Directory Structure
- `common/` - Common source files used across all platforms
- `darwin/` - macOS-specific source files
- `unix/` - Unix/Linux-specific source files
- `windows/` - Windows-specific source files

## Key Features

1. **Cross-platform support** - Builds on Windows, macOS, and Linux
2. **Conditional compilation** - Platform-specific code is compiled appropriately
3. **Build type support** - Debug and Release builds
4. **Library type support** - Shared and static library builds
5. **Proper linking** - Platform-specific libraries are linked correctly
6. **Header installation** - Headers are installed to standard locations

## Build Instructions

```bash
mkdir build
cd build
cmake ..
make
```

## CMake Options

- `BUILD_SHARED_LIBS` (default: ON) - Build shared libraries
- `BUILD_TESTS` (default: OFF) - Build tests (excluded from this project)
- `BUILD_EXAMPLES` (default: OFF) - Build examples (excluded from this project)

## Platform-specific Notes

### Windows
- Uses Visual Studio or MinGW toolchain
- Links against Windows system libraries

### macOS
- Uses Cocoa framework
- Requires Xcode command line tools

### Linux
- Uses X11
- Requires X11 development libraries