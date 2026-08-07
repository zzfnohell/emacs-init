cmake_minimum_required(VERSION 3.15)

project(__PROJECT-NAME__ VERSION 0.0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

find_package(SQLite3 REQUIRED)
find_package(spdlog REQUIRED)
find_package(doctest REQUIRED)

add_executable(${PROJECT_NAME} src/main.cpp)
target_link_libraries(${PROJECT_NAME} PRIVATE SQLite::SQLite3 spdlog::spdlog)

include(CTest)
add_executable(${PROJECT_NAME}-tests tests/main_test.cpp)
target_link_libraries(${PROJECT_NAME}-tests PRIVATE doctest::doctest)
add_test(NAME ${PROJECT_NAME}-Unit-Tests COMMAND ${PROJECT_NAME}-tests)

include(GNUInstallDirs)
set_target_properties(${PROJECT_NAME} PROPERTIES DEBUG_POSTFIX "d")

install(
  TARGETS ${PROJECT_NAME}
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
