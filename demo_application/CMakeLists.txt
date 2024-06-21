# Set the demo executable name
add_executable(quad_demo)

# Collect sources
file(GLOB_RECURSE srcs CONFIGURE_DEPENDS RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} "windows/*.[ch]pp")
target_sources(quad_demo PRIVATE ${srcs})

target_compile_options(engine PRIVATE ${QUAD_COMPILE_OPTIONS})
target_link_libraries(quad_demo Quad::Engine)
