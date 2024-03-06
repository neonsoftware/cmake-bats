cmake_minimum_required(VERSION 3.0)
project(sample-project)

add_executable(duplicator duplicator.cpp)

include(FetchContent)

FetchContent_Declare(
        bats
        GIT_REPOSITORY https://github.com/bats-core/bats-core.git
        GIT_TAG v1.10.0
        INSTALL_COMMAND ${bats_SOURCE_DIR}/install.sh ${bats_BINARY_DIR})

FetchContent_MakeAvailable(bats)

# import cmake-bats
FetchContent_Declare(
        cmake-bats
        GIT_REPOSITORY https://github.com/neonsoftware/cmake-bats.git
        GIT_TAG main)

FetchContent_MakeAvailable(cmake-bats)
list(APPEND CMAKE_MODULE_PATH ${cmake-bats_SOURCE_DIR}/cmake)


include(BatsTest)
include(CTest)

# discover all tests in all .bats files
file(GLOB BATS_TEST_FILES_SRC *.sh *.bats)
bats_discover_tests("${BATS_TEST_FILES_SRC}")