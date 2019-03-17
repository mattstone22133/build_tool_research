############################################################
## This is a subdirectory CMakeLists that adds a library
############################################################

#STATIC     #this is the default
#SHARED
#MODULE     #don't use this; like .dll but no linker?
add_library(
    HelloLibrary STATIC
    src/HelloLib/Hello.hpp
    src/HelloLib/Hello.cpp
)

target_include_directories(HelloLibrary PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/src") #PUBLIC means that users of this library will add this include path to their include paths

target_compile_definitions(HelloLibrary PUBLIC HELLO_LIB_VERSION=2) #library and code-linking-library has this defined
#target_compile_definitions(HelloLibrary PRIVATE HELLO_LIB_VERSION=2) # only library has this defined in src
#target_compile_definitions(HelloLibrary INTERFACE HELLO_LIB_VERSION=2) #only code linking library has this defined

