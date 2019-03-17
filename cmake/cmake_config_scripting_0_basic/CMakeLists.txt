cmake_minimum_required(VERSION 3.11.0)
project(DemoScripting VERSION 1.01)

add_executable(programName main.cpp)


#demo some scripting

#all arguments are strings
message(STATUS This is a string that concatenates)
message(STATUS "don't concatenate this")

set(MyVar "This is my custom var")
set(ConcatVar This is my custom var)

message(STATUS "variable1: ${MyVar}")
message(STATUS "variable2: ${ConcatVar}")

message(STATUS "project ${PROJECT_NAME}")
message(STATUS "project version ${PROJECT_VERSION}")