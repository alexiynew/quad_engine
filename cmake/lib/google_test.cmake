include(FetchContent)

FetchContent_Declare(
    GoogleTest
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG        v1.14.0
)

set(BUILD_GMOCK OFF CACHE BOOL "" FORCE)
set(INSTALL_GTEST OFF CACHE BOOL "" FORCE)

FetchContent_MakeAvailable(GoogleTest)

if (${GCC_LIKE_COMPILER}) 
    target_compile_options(gtest PRIVATE "-Wno-undef")
    target_compile_options(gtest_main PRIVATE "-Wno-undef")
endif()

set_target_properties(gtest PROPERTIES FOLDER external)
set_target_properties(gtest_main PROPERTIES FOLDER external)

add_library(Lib::GoogleTest ALIAS gtest_main)
