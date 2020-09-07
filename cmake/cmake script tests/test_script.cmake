#go to directory, and type 
# cmake -P test_script.cmake
#to run this as a script

message(STATUS "compress" "this" "list" "of" "strings")

set(var a b c)

message(STATUS ${var})
message(STATUS "${var}")
