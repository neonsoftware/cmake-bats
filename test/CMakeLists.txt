cmake_minimum_required(VERSION 3.0)
project(example_project)

include(CTest)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/..)
include(BatsTest)

SET(BATS_TESTS "")
execute_process(COMMAND echo bar OUTPUT_VARIABLE FOO)

foreach (bats_test IN LISTS BATS_TESTS)
    message("_my_list has ${bats_test} but _my_other_list does not!!")
endforeach()

ADD_CUSTOM_TARGET(ciao)

bats_discover_tests(
        ciao
        TEST_PREFIX "IntegrationTest.${GTEST_PREFIX}"
        WORKING_DIRECTORY ${GTEST_WORKING_DIRECTORY} DISCOVERY_MODE PRE_TEST)