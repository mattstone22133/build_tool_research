cmake_minimum_required(VERSION 3.11.0)
project(LibraryDemo)

add_subdirectory(library_dir)
add_subdirectory(executable_dir) #make sure this is after the library it uses, because the executable sub_dir adds library from library_dir
                                 #personally, this sounds like a terrible way to set up a build system, but following tutorial. But I guess it
                                 #is realistic in the sense that libraries you use will have their own CMakeLists.txt
#make sure the ALL_BUILD is not the start up project for visual studio!
#set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT bar)
