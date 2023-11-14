cmake_minimum_required(VERSION 3.27)

project(__PROJECT-NAME__ VERSION 0.0.1 LANGUAGES CXX)

set(CMAKE_VERBOSE_MAKEFILE ON)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

find_package(SWIG REQUIRED)
include (UseSWIG)

find_package(lua REQUIRED)
find_package(Sqlite3 REQUIRED)
find_package(spdlog REQUIRED)
find_package(doctest REQUIRED)

SET(DEP_LIBS SQLite::SQLite3 doctest::doctest lua::lua spdlog::spdlog)

SET(SOURCE_FILES src/lib.cpp)
SET(TEST_SOURCE_FILES tests/lib_test.cpp)

INCLUDE_DIRECTORIES(src/include)

SET_SOURCE_FILES_PROPERTIES(src/lib.i PROPERTIES CPLUSPLUS ON)
SET_SOURCE_FILES_PROPERTIES(src/lib.i PROPERTIES SWIG_FLAGS "-includeall")
SET_SOURCE_FILES_PROPERTIES(src/lib.i PROPERTIES SWIG_USE_TARGET_INCLUDE_DIRECTORIES ON)

swig_add_library("${PROJECT_NAME}" TYPE SHARED LANGUAGE Lua SOURCES src/lib.i ${SOURCE_FILES})
set_target_properties("${PROJECT_NAME}" PROPERTIES
  SWIG_INCLUDE_DIRECTORIES ${PROJECT_SOURCE_DIR}/include
  SWIG_USE_TARGET_INCLUDE_DIRECTORIES ON
  POSITION_INDEPENDENT_CODE ON)

# BUILD_INTERFACE specifies where to find includes during build time
# here we set the include directory to be our src include directory
# as well as CMAKE_CURRENT_BINARY_DIR, which is where the generated
# calc_exported.h file is located.
# the command must be included in double quotes so the two directories,
# separated by a ';' can both be used (cmake needs it to be a string)
target_include_directories(
  ${PROJECT_NAME}
  PUBLIC
  "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include/;${CMAKE_CURRENT_BINARY_DIR}/>"
  $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)

SWIG_LINK_LIBRARIES("${PROJECT_NAME}" PUBLIC ${DEP_LIBS})

## Test Project
SET(TEST_PROJECT_NAME ${PROJECT_NAME}-test)
add_executable("${TEST_PROJECT_NAME}")
target_sources("${TEST_PROJECT_NAME}" PRIVATE ${TEST_SOURCE_FILES})
target_include_directories(
  "${TEST_PROJECT_NAME}"
  PUBLIC
  "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include/;${CMAKE_CURRENT_BINARY_DIR}/>"
  $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)
target_link_libraries("${TEST_PROJECT_NAME}" PRIVATE ${PROJECT_NAME} ${DEP_LIBS})

include(GNUInstallDirs)


set_target_properties(${PROJECT_NAME} PROPERTIES DEBUG_POSTFIX "d")

# generates header to provide export macros for library
include(GenerateExportHeader)
generate_export_header(${PROJECT_NAME} BASE_NAME "${PROJECT_NAME}")

# specify the target to install (calculator library defined above)
# set the export name <name>-config (does not need to match target name)
# also specify where the .dylib/.so/.dll+.lib file should be installed
install(
  TARGETS ${PROJECT_NAME}
  EXPORT ${PROJECT_NAME}-config
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})

install(
  EXPORT ${PROJECT_NAME}-config
  NAMESPACE ${PROJECT_NAME}::
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME})

install(DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/include/
  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME})

# copy the generated export file to the include install location
install(FILES "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}_export.h"
  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME})
