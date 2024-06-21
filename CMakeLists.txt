cmake_minimum_required(VERSION 3.30 FATAL_ERROR)

# Project options
option(BUILD_TESTS "Build engine unit-tests" ON)
option(BUILD_DEMO_APPLICATION "Build Demo Application" ON)

if (NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()

# Misc settings
set(CMAKE_VERBOSE_MAKEFILE ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

# Add cmake modules path
list(APPEND CMAKE_MODULE_PATH  "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

# Set cpp standard
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Compilation flags
set(GCC_LIKE_COMPILER "$<COMPILE_LANG_AND_ID:CXX,ARMClang,AppleClang,Clang,GNU,LCC>")
set(MSVC_LIKE_COMPILER "$<COMPILE_LANG_AND_ID:CXX,MSVC>")
set(GCC_OPTIONS "-Wall;-Wextra;-Wshadow;-Wunused;-Werror;-Wno-unknown-pragmas;-Wno-language-extension-token")
set(MSVC_OPTIONS "-W4;-WX;-DNOMINMAX;-DUNICODE")
set(QUAD_COMPILE_OPTIONS "$<${GCC_LIKE_COMPILER}:${GCC_OPTIONS}>;$<${MSVC_LIKE_COMPILER}:${MSVC_OPTIONS}>")

# Set the project name
project(Engine LANGUAGES CXX VERSION 0.0.1)

# Collect sources
file(GLOB_RECURSE srcs CONFIGURE_DEPENDS RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} "src/*.[ch]pp" "include/*.hpp")

# Add library
add_library(engine STATIC ${srcs})
add_library(Quad::Engine ALIAS engine)

# Set compilation flags
target_compile_options(engine PUBLIC ${QUAD_COMPILE_OPTIONS})

# Setup include paths
target_include_directories(engine PUBLIC include)

if (BUILD_DEMO_APPLICATION) 
    add_subdirectory(demo_application)
endif()

if (BUILD_TESTS)
    enable_testing()
    add_subdirectory(tests)
endif()
