cmake_minimum_required(VERSION 3.15)

project(sample VERSION 0.0.1 LANGUAGES CXX)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

set(CMAKE_VERBOSE_MAKEFILE ON)
include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

find_package(SQLite3 REQUIRED)

SET(SOURCE_FILES src/main.cpp)
SET(TEST_SOURCE_FILES tests/main_test.cpp)

## Main EXE
add_executable(${PROJECT_NAME} ${SOURCE_FILES})

target_include_directories(${PROJECT_NAME} PUBLIC ${DOCTEST_INCLUDE_DIR})b
target_sources(${PROJECT_NAME} PRIVATE ${SOURCE_FILES}) 
target_link_libraries(${PROJECT_NAME} ${CONAN_LIBS})

## Test
add_executable("${PROJECT_NAME}-tests" ${TEST_SOURCE_FILES})

target_include_directories(
    "${PROJECT_NAME}-tests"
    PUBLIC
        "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include/;${CMAKE_CURRENT_BINARY_DIR}/>"
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)

target_link_libraries("${PROJECT_NAME}-tests" PRIVATE ${CONAN_LIBS})

include(GNUInstallDirs)

set_target_properties(${PROJECT_NAME} PROPERTIES DEBUG_POSTFIX "d")

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

