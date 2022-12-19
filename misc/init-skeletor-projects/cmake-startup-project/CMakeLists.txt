cmake_minimum_required(VERSION 3.12)


project(startup)

include_directories(include)
set(SOURCES src/main.c)

add_executable(${PROJECT_NAME} ${SOURCES})
