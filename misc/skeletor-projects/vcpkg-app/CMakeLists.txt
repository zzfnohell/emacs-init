cmake_minimum_required(VERSION 3.15)

project(__PROJECT-NAME__ CXX)

find_package(doctest REQUIRED)
find_package(fmt REQUIRED)
find_package(range-v3 REQUIRED)
find_package(cxxopts REQUIRED)

set(CMAKE_CXX_STANDARD 17)

option(ENABLE_CCACHE "Build with ccache." OFF)
if(ENABLE_CCACHE)
  find_program(CCACHE_PATH ccache)
  if(CCACHE_PATH)
    message(STATUS "Using ccache at ${CCACHE_PATH}")
    set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ${CCACHE_PATH})
    set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK ${CCACHE_PATH})
  else()
    message(STATUS "Could not find ccache")
  endif()
endif()

option(ENABLE_SCCACHE "Build with sccache." ON)
if(ENABLE_SCCACHE)
  find_program(SCCACHE_PATH sccache)
  if(SCCACHE_PATH)
    message(STATUS "Using sccache at ${SCCACHE_PATH}")
    set(CMAKE_C_COMPILER_LAUNCHER ${SCCACHE_PATH})
    set(CMAKE_CXX_COMPILER_LAUNCHER ${SCCACHE_PATH})
  else()
    message(STATUS "Could not find sccache")
  endif()
endif()


add_executable(${PROJECT_NAME} main.cpp)

target_link_libraries(${PROJECT_NAME}
  PRIVATE
  fmt::fmt
  range-v3::range-v3
  cxxopts::cxxopts
  doctest:doctest)
