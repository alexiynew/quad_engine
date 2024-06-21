

# Collct sources
file(GLOB_RECURSE srcs CONFIGURE_DEPENDS src/*.cpp include/*.h)

# Set library
add_library(backend STATIC ${srcs})
target_include_directories(backend PUBLIC include)

add_library(quad::backend ALIAS backend)
