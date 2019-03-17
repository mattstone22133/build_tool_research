############################################################
## This is a subdirectory CMakeLists that is the executable
############################################################
project(executable VERSION 2.0.1)
add_executable(UsesLibrary main.cpp)
target_link_libraries(UsesLibrary PRIVATE HelloLibrary)


# print_cmake_vars()