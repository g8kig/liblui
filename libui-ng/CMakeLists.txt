cmake_minimum_required(VERSION 3.10)
project(libui LANGUAGES C CXX)

# Set C standard
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)

# Set C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Options
option(BUILD_SHARED_LIBS "Build shared libraries" ON)

# Set default build type to Debug
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Debug)
endif()

# Set default library type to shared
if(NOT BUILD_SHARED_LIBS)
    add_definitions(-D_UI_STATIC)
endif()

# Compiler-specific options
if(MSVC)
    # MSVC specific options
    add_compile_options(/W3 /wd4100 /bigobj)
    if(CMAKE_BUILD_TYPE MATCHES Debug)
        add_compile_options(/RTC1 /RTCs /RTCu)
    endif()
else()
    # GCC/Clang specific options
    add_compile_options(-Wall -Wextra -Wno-unused-parameter -Wno-switch)
endif()

# Platform-specific settings
if(APPLE)
    # macOS specific settings
    set(CMAKE_OSX_DEPLOYMENT_TARGET "10.8")
    set(CMAKE_OSX_ARCHITECTURES "x86_64;arm64")
    
    # Add Objective-C support
    set(CMAKE_XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_ARC YES)
endif()

# Include directories
include_directories(${CMAKE_CURRENT_SOURCE_DIR})

# Common sources
set(LIBUI_COMMON_SOURCES
    common/areaevents.c
    common/attribute.c
    common/attrlist.c
    common/attrstr.c
    common/control.c
    common/debug.c
    common/matrix.c
    common/opentype.c
    common/shouldquit.c
    common/table.c
    common/tablemodel.c
    common/tablevalue.c
    common/userbugs.c
    common/utf.c
)

# Platform-specific sources
if(WIN32)
    set(LIBUI_PLATFORM_SOURCES
        windows/alloc.cpp
        windows/area.cpp
        windows/areadraw.cpp
        windows/areaevents.cpp
        windows/areascroll.cpp
        windows/areautil.cpp
        windows/attrstr.cpp
        windows/box.cpp
        windows/button.cpp
        windows/checkbox.cpp
        windows/colorbutton.cpp
        windows/colordialog.cpp
        windows/combobox.cpp
        windows/container.cpp
        windows/control.cpp
        windows/d2dscratch.cpp
        windows/datetimepicker.cpp
        windows/debug.cpp
        windows/draw.cpp
        windows/drawmatrix.cpp
        windows/drawpath.cpp
        windows/drawtext.cpp
        windows/dwrite.cpp
        windows/editablecombo.cpp
        windows/entry.cpp
        windows/events.cpp
        windows/fontbutton.cpp
        windows/fontdialog.cpp
        windows/fontmatch.cpp
        windows/form.cpp
        windows/graphemes.cpp
        windows/grid.cpp
        windows/group.cpp
        windows/image.cpp
        windows/init.cpp
        windows/label.cpp
        windows/main.cpp
        windows/menu.cpp
        windows/multilineentry.cpp
        windows/opentype.cpp
        windows/parent.cpp
        windows/progressbar.cpp
        windows/radiobuttons.cpp
        windows/separator.cpp
        windows/sizing.cpp
        windows/slider.cpp
        windows/spinbox.cpp
        windows/stddialogs.cpp
        windows/tab.cpp
        windows/table.cpp
        windows/tabledispinfo.cpp
        windows/tabledraw.cpp
        windows/tableediting.cpp
        windows/tablemetrics.cpp
        windows/text.cpp
        windows/utilwin.cpp
        windows/winutil.cpp
        windows/winpublic.cpp
        windows/utf16.cpp
    )
    
    # Windows resource files
    set(LIBUI_PLATFORM_RESOURCES
        windows/resources.rc
    )
    
    # Windows manifest files
    set(LIBUI_PLATFORM_MANIFESTS
        windows/libui.manifest
    )
    
    # Add Windows-specific include directories
    include_directories(windows)
    
    # Add Windows-specific definitions
    add_definitions(-D_WIN32_WINNT=0x0600)
    
elseif(APPLE)
    set(LIBUI_PLATFORM_SOURCES
        darwin/aat.m
        darwin/alloc.m
        darwin/area.m
        darwin/areaevents.m
        darwin/attrstr.m
        darwin/autolayout.m
        darwin/box.m
        darwin/button.m
        darwin/checkbox.m
        darwin/colorbutton.m
        darwin/combobox.m
        darwin/control.m
        darwin/datetimepicker.m
        darwin/debug.m
        darwin/draw.m
        darwin/drawtext.m
        darwin/editablecombo.m
        darwin/entry.m
        darwin/event.m
        darwin/fontbutton.m
        darwin/fontmatch.m
        darwin/fonttraits.m
        darwin/fontvariation.m
        darwin/form.m
        darwin/future.m
        darwin/graphemes.m
        darwin/grid.m
        darwin/group.m
        darwin/image.m
        darwin/label.m
        darwin/main.m
        darwin/menu.m
        darwin/multilineentry.m
        darwin/nstextfield.m
        darwin/opentype.m
        darwin/progressbar.m
        darwin/radiobuttons.m
        darwin/scrollview.m
        darwin/separator.m
        darwin/slider.m
        darwin/spinbox.m
        darwin/stddialogs.m
        darwin/tab.m
        darwin/table.m
        darwin/tablecolumn.m
        darwin/text.m
        darwin/undocumented.m
        darwin/util.m
        darwin/window.m
        darwin/winmoveresize.m
    )
    
    # Add macOS-specific include directories
    include_directories(darwin)
    
    # Add macOS-specific frameworks
    find_library(COCOA_FRAMEWORK Cocoa)
    find_library(CORE_FOUNDATION_FRAMEWORK CoreFoundation)
    find_library(QUICK_LOOK_FRAMEWORK QuickLook)
    find_library(SECURITY_FRAMEWORK Security)
    find_library(CORE_TEXT_FRAMEWORK CoreText)
    find_library(CORE_GRAPHICS_FRAMEWORK CoreGraphics)
    find_library(OPENGL_FRAMEWORK OpenGL)
    find_library(CORE_IMAGE_FRAMEWORK CoreImage)
    find_library(FOUNDATION_FRAMEWORK Foundation)
    set(ADDITIONAL_FRAMEWORKS 
        ${COCOA_FRAMEWORK} 
        ${CORE_FOUNDATION_FRAMEWORK} 
        ${QUICK_LOOK_FRAMEWORK} 
        ${SECURITY_FRAMEWORK} 
        ${CORE_TEXT_FRAMEWORK} 
        ${CORE_GRAPHICS_FRAMEWORK} 
        ${OPENGL_FRAMEWORK} 
        ${CORE_IMAGE_FRAMEWORK} 
        ${FOUNDATION_FRAMEWORK}
    )
    
    # Add macOS-specific definitions
    add_definitions(-DMACOSX)
    
else()
    find_package(PkgConfig REQUIRED)
    pkg_check_modules(GTK REQUIRED IMPORTED_TARGET gtk3>=3.10)
    target_link_libraries(ui PRIVATE PkgConfig::GTK)

    set(LIBUI_PLATFORM_SOURCES
        unix/alloc.c
        unix/area.c
        unix/attrstr.c
        unix/box.c
        unix/button.c
        unix/cellrendererbutton.c
        unix/checkbox.c
        unix/child.c
        unix/colorbutton.c
        unix/combobox.c
        unix/control.c
        unix/datetimepicker.c
        unix/debug.c
        unix/draw.c
        unix/drawmatrix.c
        unix/drawpath.c
        unix/drawtext.c
        unix/editablecombo.c
        unix/entry.c
        unix/fontbutton.c
        unix/fontmatch.c
        unix/form.c
        unix/future.c
        unix/graphemes.c
        unix/grid.c
        unix/group.c
        unix/image.c
        unix/label.c
        unix/main.c
        unix/menu.c
        unix/multilineentry.c
        unix/progressbar.c
        unix/radiobuttons.c
        unix/separator.c
        unix/slider.c
        unix/spinbox.c
        unix/stddialogs.c
        unix/tab.c
        unix/table.c
        unix/tablemodel.c
        unix/text.c
        unix/util.c
        unix/window.c
    )
    
    # Add Unix-specific include directories
    include_directories(unix)
endif()

# Combine all sources
set(LIBUI_SOURCES
    ${LIBUI_COMMON_SOURCES}
    ${LIBUI_PLATFORM_SOURCES}
)

# Create the library
add_library(ui ${LIBUI_SOURCES})

# Set library properties
set_target_properties(ui PROPERTIES
    PREFIX "lib"
    VERSION 1.0.0
    SOVERSION 1
)

# Link libraries based on platform
if(WIN32)
    target_link_libraries(ui 
        winmm
        gdi32
        user32
        comdlg32
        shell32
        ole32
        oleaut32
        uuid
        d2d1
        dwrite
        dxgi
        d3d11
        UxTheme
    )
    
elseif(APPLE)
    target_link_libraries(ui ${ADDITIONAL_FRAMEWORKS})
    
else()
    # Unix platform libraries
    find_package(X11 REQUIRED)
    find_package(Threads REQUIRED)
    target_link_libraries(ui 
        ${X11_LIBRARIES}
        PkgConfig::GTK
        ${CMAKE_THREAD_LIBS_INIT}
        dl
        m
    )
endif()

# Install targets
install(TARGETS ui
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
)

# Install headers
install(FILES ui.h DESTINATION include)
install(FILES ui_unix.h DESTINATION include)
install(FILES ui_darwin.h DESTINATION include)
install(FILES ui_windows.h DESTINATION include)

# Install platform-specific headers
if(WIN32)
    install(FILES windows/attrstr.hpp DESTINATION include)
    install(FILES windows/area.hpp DESTINATION include)
    install(FILES windows/draw.hpp DESTINATION include)
    install(FILES windows/table.hpp DESTINATION include)
    install(FILES windows/uipriv_windows.hpp DESTINATION include)
elseif(APPLE)
    install(FILES darwin/attrstr.h DESTINATION include)
    install(FILES darwin/table.h DESTINATION include)
    install(FILES darwin/uipriv_darwin.h DESTINATION include)
else()
    install(FILES unix/attrstr.h DESTINATION include)
    install(FILES unix/table.h DESTINATION include)
    install(FILES unix/uipriv_unix.h DESTINATION include)
endif()