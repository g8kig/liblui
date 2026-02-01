cmake_minimum_required(VERSION 3.16)
set(CMAKE_OSX_ARCHITECTURES "arm64;x86_64" CACHE STRING "" FORCE)
project(lua550)

add_library(lua55 SHARED
	"src/lapi.c"
	"src/lauxlib.c"
	"src/lbaselib.c"
	"src/lcode.c"
	"src/lcorolib.c"
	"src/lctype.c"
	"src/ldblib.c"
	"src/ldebug.c"
	"src/ldo.c"
	"src/ldump.c"
	"src/lfunc.c"
	"src/lgc.c"
	"src/linit.c"
	"src/liolib.c"
	"src/llex.c"
	"src/lmathlib.c"
	"src/lmem.c"
	"src/loadlib.c"
	"src/lobject.c"
	"src/lopcodes.c"
	"src/loslib.c"
	"src/lparser.c"
	"src/lstate.c"
	"src/lstring.c"
	"src/lstrlib.c"
	"src/ltable.c"
	"src/ltablib.c"
	"src/ltm.c"
	"src/lundump.c"
	"src/lvm.c"
	"src/lzio.c"
	"src/lutf8lib.c"
	"src/lua55.def")
include_directories(src)
if(${CMAKE_SYSTEM} MATCHES "Windows")
	set_target_properties(lua55 PROPERTIES COMPILE_DEFINITIONS "LUA_BUILD_AS_DLL=1")
elseif(${CMAKE_SYSTEM} MATCHES "Linux")
	set_target_properties(lua55 PROPERTIES COMPILE_DEFINITIONS "LUA_USE_LINUX=1 LUA_USE_READLINE=1")
	target_link_libraries(lua55 PRIVATE readline dl m)
elseif(${CMAKE_SYSTEM} MATCHES "Darwin")
	set_target_properties(lua55 PROPERTIES COMPILE_DEFINITIONS "LUA_USE_MACOSX=1 LUA_USE_READLINE=1")
endif()

add_executable(lua "src/lua.c")
include_directories(src)
target_link_libraries(lua PRIVATE lua55)

add_executable(luac 
	"src/luac.c" 	
	"src/lapi.c"
	"src/lauxlib.c"
	"src/lbaselib.c"
	"src/lcode.c"
	"src/lcorolib.c"
	"src/lctype.c"
	"src/ldblib.c"
	"src/ldebug.c"
	"src/ldo.c"
	"src/ldump.c"
	"src/lfunc.c"
	"src/lgc.c"
	"src/linit.c"
	"src/liolib.c"
	"src/llex.c"
	"src/lmathlib.c"
	"src/lmem.c"
	"src/loadlib.c"
	"src/lobject.c"
	"src/lopcodes.c"
	"src/loslib.c"
	"src/lparser.c"
	"src/lstate.c"
	"src/lstring.c"
	"src/lstrlib.c"
	"src/ltable.c"
	"src/ltablib.c"
	"src/ltm.c"
	"src/lundump.c"
	"src/lvm.c"
	"src/lzio.c"
	"src/lutf8lib.c")
include_directories(src)
if(CMAKE_SYSTEM MATCHES Linux)
	target_link_libraries(luac PRIVATE m)
endif()

