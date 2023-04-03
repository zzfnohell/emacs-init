cmake_minimum_required(VERSION 3.15)

project(samplelib VERSION 0.0.1 LANGUAGES CXX)

set(CMAKE_VERBOSE_MAKEFILE ON)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

find_package(SWIG REQUIRED)
include (UseSWIG)

find_package(SQLite3)
find_package(Lua)

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

set_property(TARGET ${PROJECT_NAME} PROPERTY CXX_STANDARD 23)

target_include_directories("${PROJECT_NAME}" PUBLIC ${DOCTEST_INCLUDE_DIR} ${spdlog_INCLUDE_DIR})
SWIG_LINK_LIBRARIES("${PROJECT_NAME}" PRIVATE ${CONAN_LIBS})


add_executable("${PROJECT_NAME}-tests")
target_include_directories(
    "${PROJECT_NAME}-tests"
    PUBLIC
        "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include/;${CMAKE_CURRENT_BINARY_DIR}/>"
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)

target_sources("${PROJECT_NAME}-tests" PRIVATE ${TEST_SOURCE_FILES})
target_link_libraries("${PROJECT_NAME}-tests" PRIVATE ${PROJECT_NAME} ${CONAN_LIBS})

include(GNUInstallDirs)

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

# set_target_properties(${PROJECT_NAME} PROPERTIES DEBUG_POSTFIX "d")

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
