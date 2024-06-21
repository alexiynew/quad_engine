set(TEST_DRIVER_NAME quad_tests)

file(GLOB_RECURSE srcs CONFIGURE_DEPENDS RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} "*.[hc]pp")

# Create the testing file and list of tests
create_test_sourcelist(tests_srcs
    ${TEST_DRIVER_NAME}.cpp
    ${srcs}
)

# Add the executable
add_executable(${TEST_DRIVER_NAME} ${tests_srcs})

# Add all the ADD_TEST for each test
foreach(test ${srcs})
    get_filename_component(test_name ${test} NAME_WE)
    add_test(NAME ${test_name} COMMAND ${TEST_DRIVER_NAME} ${test_name})
endforeach()

include(lib/google_test)
target_link_libraries(${TEST_DRIVER_NAME} PRIVATE Lib::GoogleTest Quad::Engine)
target_compile_options(${TEST_DRIVER_NAME} PRIVATE ${QUAD_COMPILE_OPTIONS})
