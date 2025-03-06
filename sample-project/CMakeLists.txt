cmake_minimum_required(VERSION 3.16)
project(sample-project)

add_executable(duplicator duplicator.cpp)


###### Importing and installing BATS at configure-time via FetchContent
#
include(FetchContent)
FetchContent_Declare(
        bats
        GIT_REPOSITORY https://github.com/bats-core/bats-core.git
        GIT_TAG v1.10.0)
FetchContent_MakeAvailable(bats)
# we want bats to be ready at configure-time, so we promptly install it with execute_process
execute_process(COMMAND ${bats_SOURCE_DIR}/install.sh ${bats_BINARY_DIR})
# We set MANUALLY the path so that find_program will find already, at configure-time it within cmake-bats
set(CMAKE_PROGRAM_PATH ${bats_BINARY_DIR}/bin)
#
###################################################


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
