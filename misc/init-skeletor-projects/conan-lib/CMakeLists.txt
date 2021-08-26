cmake_minimum_required(VERSION 3.15)

project(samplelib VERSION 0.0.1 LANGUAGES CXX)


set(CMAKE_VERBOSE_MAKEFILE ON)
include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup(TARGETS)

find_package(SQLite3 REQUIRED)

SET(SOURCE_FILES src/lib.cpp)
SET(TEST_SOURCE_FILES tests/lib_test.cpp)


add_library(${PROJECT_NAME} SHARED)
target_include_directories(${PROJECT_NAME} PUBLIC ${DOCTEST_INCLUDE_DIR})
target_sources(${PROJECT_NAME} PRIVATE ${SOURCE_FILES}) 
target_link_libraries(${PROJECT_NAME} PUBLIC CONAN_PKG::doctest)
target_link_libraries(${PROJECT_NAME} PUBLIC SQLite::SQLite3)


add_executable("${PROJECT_NAME}-tests" ${TEST_SOURCE_FILES})

target_include_directories(
    "${PROJECT_NAME}-tests"
    PUBLIC
        "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include/;${CMAKE_CURRENT_BINARY_DIR}/>"
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)

target_link_libraries("${PROJECT_NAME}-tests" PRIVATE CONAN_PKG::doctest)
target_link_libraries("${PROJECT_NAME}-tests" PRIVATE SQLite::SQLite3)
target_link_libraries("${PROJECT_NAME}-tests" PRIVATE ${PROJECT_NAME})


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
