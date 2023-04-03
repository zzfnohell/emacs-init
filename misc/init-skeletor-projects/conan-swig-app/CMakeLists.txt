cmake_minimum_required(VERSION 3.15)

project(__PROJECT-NAME__ VERSION 0.0.1 LANGUAGES CXX)

set(CMAKE_VERBOSE_MAKEFILE ON)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")


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

set_property(TARGET ${PROJECT_NAME} PROPERTY CXX_STANDARD 23)

# add_custom_command(
#     TARGET ${PROJECT_NAME}
#     PRE_BUILD 
#     COMMAND swig
#     ARGS -Wall -c++ -includeall -lua
#     -I"${CMAKE_CURRENT_SOURCE_DIR}/include/"
#     -o ${SWIG_CXX_OUTPUT}
#     ${SWIG_SOURCE}
#     WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})

target_include_directories(${PROJECT_NAME} PUBLIC  ${DOCTEST_INCLUDE_DIR} ${spdlog_INCLUDE_DIR})
target_link_libraries(${PROJECT_NAME} ${CONAN_LIBS})


add_executable(${PROJECT_NAME}-test ${SOURCE_FILES})
set_property(TARGET ${PROJECT_NAME}-test PROPERTY CXX_STANDARD 23)
target_include_directories(${PROJECT_NAME}-test PUBLIC ${DOCTEST_INCLUDE_DIR} ${spdlog_INCLUDE_DIR})
target_link_libraries(${PROJECT_NAME}-test ${CONAN_LIBS})


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

