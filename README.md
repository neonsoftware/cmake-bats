[![CMake on multiple platforms](https://github.com/neonsoftware/cmake-bats/actions/workflows/cmake-multi-platform.yml/badge.svg)](https://github.com/neonsoftware/cmake-bats/actions/workflows/cmake-multi-platform.yml)

# cmake-bats
CMake integration of the BATS shell testing framework

![](https://geps.dev/progress/50) WORK IN PROGRESS

# usage

In your CMakeLists.txt

```
include(FetchContent)

FetchContent_Declare(
        bats
        GIT_REPOSITORY https://github.com/bats-core/bats-core.git
        GIT_TAG v1.10.0
        INSTALL_COMMAND ${bats_SOURCE_DIR}/install.sh ${bats_BINARY_DIR})

FetchContent_MakeAvailable(bats)

# TODO check the case where here, without quotes I get multiple values.
bats_discover_tests("${BATS_TEST_FILES_SRC}")
```
