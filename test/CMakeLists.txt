cmake_minimum_required(VERSION 3.0)
project(example_project)

include(CTest)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/../cmake)
include(BatsTest)

file(GLOB BATS_TEST_FILES_SRC *.sh *.bats)

message("+++ all are:${BATS_TEST_FILES_SRC}")

# TODO check the case where here, without quotes I get multiple values.
bats_discover_tests("${BATS_TEST_FILES_SRC}")