############################################################
## This is a subdirectory CMakeLists that is the executable
############################################################

add_executable(UsesLibrary main.cpp)
target_link_libraries(UsesLibrary PRIVATE HelloLibrary)