[![CMake on multiple platforms](https://github.com/neonsoftware/cmake-bats/actions/workflows/cmake-multi-platform.yml/badge.svg)](https://github.com/neonsoftware/cmake-bats/actions/workflows/cmake-multi-platform.yml)

# cmake-bats

Test your C++ application with the shell [BATS testing framework](https://github.com/bats-core/bats-core).

CMake and CTest integration of the BATS shell testing framework, allowing automatic test discovery and execution. 

# usage

In your CMakeLists.txt

```cmake
include(CTest)

include(FetchContent)

# import cmake-bats
FetchContent_Declare(
        cmake-bats
        GIT_REPOSITORY https://github.com/neonsoftware/cmake-bats.git
        GIT_TAG main)

FetchContent_MakeAvailable(cmake-bats)

# include bats test discovery
list(APPEND CMAKE_MODULE_PATH ${cmake-bats_SOURCE_DIR}/cmake)
include(BatsTest)

# discover all tests in all .bats files
file(GLOB BATS_TEST_FILES_SRC *.sh *.bats)
bats_discover_tests("${BATS_TEST_FILES_SRC}")
```


Or see how the C++ application is tested in the [sample project](./sample-project).
