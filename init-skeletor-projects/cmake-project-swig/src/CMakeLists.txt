cmake_minimum_required(VERSION 2.13)

FIND_PACKAGE(SWIG REQUIRED)
INCLUDE(${SWIG_USE_FILE})

find_package (Python COMPONENTS Interpreter Development)
INCLUDE_DIRECTORIES(${Python_INCLUDE_DIRS})
link_directories(${Python_LIBRARY_DIRS})

INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR})

SET(CMAKE_SWIG_FLAGS "")

SET_SOURCE_FILES_PROPERTIES(sample.i PROPERTIES CPLUSPLUS ON)
SET_SOURCE_FILES_PROPERTIES(sample.i PROPERTIES SWIG_FLAGS "-includeall")

# set (UseSWIG_TARGET_NAME_PREFERENCE STANDARD)
SWIG_ADD_LIBRARY(sample LANGUAGE python SOURCES sample.i sample.cpp)
swig_link_libraries(sample ${PYTHON_LIBRARIES})