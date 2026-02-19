# CMake toolchain file for libui

# Set the target system
set(CMAKE_SYSTEM_NAME Generic)

# Set the target architecture
set(CMAKE_SYSTEM_PROCESSOR x86_64)

# Set the compiler
set(CMAKE_C_COMPILER clang)
set(CMAKE_CXX_COMPILER clang++)

# Set the C standard
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)

# Set the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)