cmake_minimum_required(VERSION 3.0)
project(example_project)

include(CTest)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/../cmake)
include(BatsTest)

file(GLOB BATS_TEST_FILES_SRC *.sh *.bats)

include(FetchContent)

FetchContent_Declare(
        bats
        GIT_REPOSITORY https://github.com/bats-core/bats-core.git
        GIT_TAG v1.10.0
        INSTALL_COMMAND ${bats_SOURCE_DIR}/install.sh ${bats_BINARY_DIR})

FetchContent_MakeAvailable(bats)

# TODO check the case where here, without quotes I get multiple values.
bats_discover_tests("${BATS_TEST_FILES_SRC}")