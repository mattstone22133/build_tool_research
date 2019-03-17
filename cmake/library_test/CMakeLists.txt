cmake_minimum_required(VERSION 3.11.0)
project(LibraryDemo)

#libray types:
#STATIC     #this is the default
#SHARED
#MODULE     #don't use this; like .dll but no linker?
add_library(
    HelloLibrary SHARED
    Hello.hpp
    Hello.cpp
)

add_executable(UsesLibrary main.cpp)

target_link_libraries(UsesLibrary PRIVATE HelloLibrary)

#make sure the ALL_BUILD is not the start up project for visual studio!
#set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT bar)
