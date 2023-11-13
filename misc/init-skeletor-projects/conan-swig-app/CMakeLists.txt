cmake_minimum_required(VERSION 3.27)

project(__PROJECT-NAME__ VERSION 0.0.1 LANGUAGES CXX)

set(CMAKE_VERBOSE_MAKEFILE ON)
set(CMAKE_CXX_STANDARD 20)
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

SET(SWIG_CXX_OUTPUT lib_wrap.cpp)
SET(SOURCE_FILES src/main.cpp src/lib.cpp ${SWIG_CXX_OUTPUT})
SET(TEST_SOURCE_FILES test/main.cpp src/lib.cpp ${SWIG_CXX_OUTPUT})
SET(SWIG_SOURCE src/lib.i)

INCLUDE_DIRECTORIES(include)

SET_SOURCE_FILES_PROPERTIES(src/lib.i PROPERTIES CPLUSPLUS ON)
SET_SOURCE_FILES_PROPERTIES(src/lib.i PROPERTIES SWIG_FLAGS "-includeall")
SET_SOURCE_FILES_PROPERTIES(src/lib.i PROPERTIES SWIG_USE_TARGET_INCLUDE_DIRECTORIES ON)

add_custom_command(
  OUTPUT ${SWIG_CXX_OUTPUT}
  COMMAND swig
  ARGS -Wall -c++ -includeall -lua
  -I${CMAKE_CURRENT_SOURCE_DIR}/include
  -o ${CMAKE_CURRENT_BINARY_DIR}/${SWIG_CXX_OUTPUT}
  ${SWIG_SOURCE}
  DEPENDS ${SWIG_SOURCE}
  BYPRODUCTS ${SWIG_CXX_OUTPUT}
  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
  VERBATIM)

## Main EXE
add_executable(${PROJECT_NAME} ${SOURCE_FILES})

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
target_link_libraries(${PROJECT_NAME} PRIVATE ${DEP_LIBS})

## Test Project
SET(TEST_PROJECT_NAME ${PROJECT_NAME}-test)
add_executable("${TEST_PROJECT_NAME}")
target_sources("${TEST_PROJECT_NAME}" PRIVATE ${TEST_SOURCE_FILES})
target_include_directories(
  "${TEST_PROJECT_NAME}"
  PUBLIC
  "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include/;${CMAKE_CURRENT_BINARY_DIR}/>"
  $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)
target_link_libraries(${TEST_PROJECT_NAME} PRIVATE ${DEP_LIBS})

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
