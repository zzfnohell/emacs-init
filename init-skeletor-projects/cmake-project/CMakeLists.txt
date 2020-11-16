cmake_minimum_required(VERSION 2.8.9)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

project(registration)

find_package(Linphone REQUIRED)
#Bring the headers, such as Student.h into the project
include_directories(include ${LINPHONE_INC_DIR})



set(SOURCES src/main.c)

add_executable(registration ${SOURCES})
target_link_libraries(registration ${LINPHONE_LIBRARIES})
