# liblui

Lua 5.4 GUI system using libui-ng and lui.
Cross platform Linux, MacOS and Windows

## Project Overview

This project is a comprehensive GUI development framework that combines several components:

1. **libui-ng** - A portable GUI library for C
2. **lui** - Lua bindings for libui
3. **Lua 5.x** - The Lua scripting language runtime

## Components

### libui-ng
libui-ng is a fork of andlabs/libui, a portable GUI library for C that uses the native GUI technologies of each platform it supports.

**Key Features:**
- Simple and portable GUI library in lua
- Uses native GUI technologies for each platform
- Supports Windows, Unix (GTK+ 3.10+), and Mac OS X (10.8+)
- Build requirements: CMake and Ninja backend

**Platforms Supported:**
- Windows: Windows 10 or newer
- Unix: GTK+ 3.10 or newer
- Mac OS X: OS X 10.10 or newer

### lui
lui is a binding of libui to Lua, providing Lua developers with access to the GUI capabilities of libui-ng

**Key Features:**
- Complete binding of libui-ng to Lua
- Single dynamic library module
- Currently supports Lua 5.x on Windows, MacOS and Linux
- Compatible with LuaRocks

### Lua 5.x
This project includes multiple versions of the Lua scripting language:
- Lua 5.4.6
- Lua 5.4.7
- Lua 5.5.0

These versions provide the runtime environment for Lua scripts and extensions.

## Build Instructions

The project uses a combination of build systems:
- CMake for libui-ng, lua and lui
- Meson for building libui-ng components

## Samples

The project includes sample applications demonstrating the usage of the GUI components:
- Controls samples
- Table samples
- Menu samples

## License

This project is distributed under the MIT license.

