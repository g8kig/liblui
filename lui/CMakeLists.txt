cmake_minimum_required(VERSION 3.16)
set(CMAKE_OSX_ARCHITECTURES "arm64;x86_64" CACHE STRING "" FORCE)
project(lui)

add_library(lui SHARED
	"lui.c"
	"luad.c"
	"lui.def")
if(${CMAKE_SYSTEM} MATCHES "Windows")
    target_link_libraries(lui PRIVATE lua54 ui stdc++ uxtheme comctl32 d2d1 dwrite)
else()
    target_link_libraries(lui PRIVATE lua54 ui)
endif()
target_include_directories(lui PRIVATE "../libui-ng" "../lua-5.4.6/src")
target_link_directories(lui PRIVATE "../libui-ng/build" "../lua-5.4.6/build")
#target_compile_definitions(lui PUBLIC DEBUG=1)

