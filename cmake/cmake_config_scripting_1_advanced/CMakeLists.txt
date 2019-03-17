cmake_minimum_required(VERSION 3.11.0)
project(DemoScripting VERSION 1.01)

add_executable(programName main.cpp)


#demo some scripting
message(STATUS "\n\n\n")




if("TRUE")
    message(STATUS "If statements interpret TRUE and FALSE strings")
endif()

if(TRUE)
    message(STATUS "Quotes are not needed")
endif()

if (NOT FALSE)
    message(STATUS "FALSE is the other boolean")
endif()

if(FALSE)
    message(STATUS "What... this shouldn't be called..")
else()
    message(STATUS "Demoing else() statement")
endif()




set(myBool TRUE)
if(myBool) #same as "${myBool}"
    message(STATUS "Using vars in branches")
endif()




set(STR_A "abc")
set(STR_B "abc")
set(STR_C "xyz")

if(STR_A STREQUAL STR_B)
    message(STATUS "Strings Match")
else()
    message(STATUS "Strings do not match")
endif()


#note that str "abc" is a literal, and the variable STR_A is auto-deferenced
if( (STR_A STREQUAL "abc") AND NOT (STR_B STREQUAL "abc")) #it appears not has to go outside parenthesis
    message(STATUS "Complex condition")
elseif(STR STREQUAL "ABC")
    message(STATUS "second matches")
endif()


#equal is for arithmetic comparisons
set(x "1")
if(x EQUAL "1")
    message(STATUS "arithmetic value match")
endif()

#matches can be used for regular expression matching
if(STR_A MATCHES "c$")
    message(STATUS "var ends with c")
endif()

message(STATUS "\n\n\n")
# --------------------------- looping -----------------------------------
set (iter 0)
while(iter LESS 10)
    message(STATUS "iter value is ${iter}")
    math(EXPR iter "${iter} +  1")
endwhile()
# ----------------------------
foreach(item IN ITEMS foo bar baz qux)
    message(STATUS "item is ${item}")
endforeach()
# ----------------------------
set(LIST1 1 2)
set(LIST2 8 9)
message(STATUS "\n\nlist is")
message(STATUS ${LIST1}) #special syntax to expand lists doesn't use quotes around variable dereferencing

foreach(item IN LISTS LIST1 LIST2)
    message(STATUS "item is ${item}")
endforeach()

message(STATUS "\n") 
# ----------------------------
foreach(idx RANGE 3)
    message(STATUS "idx is ${idx}") #this is inclusive [0,3]
endforeach()

message(STATUS "\n") 
# ----------------------------
foreach(idx RANGE 0 10 2) #start, inclusive_end, step_size
    message(STATUS "idx is ${idx}") 
endforeach()

message(STATUS "\n") 
# ----------------------------
# ----------------------------
# ----------------------------

message(STATUS "\n\n\n")