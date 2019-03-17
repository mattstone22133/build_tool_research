cmake_minimum_required(VERSION 3.11.0)
project(DemoScripting VERSION 1.01)

add_executable(programName main.cpp)


#demo some scripting
message(STATUS "\n\n\n")

# ----------------------------
#cmake properties
set_property(        #all arguments below are just strings, and have quotes around them
    GLOBAL           #GLOBAL argument specifying global scope; acts kind of like an enum
    PROPERTY FOO    #property is 'acting' as keyword specifier; foo is acting as property name
    1
    2
    3
)

get_cmake_property(out_var_name FOO)
message(STATUS "property FOO has value ${out_var_name}")  #property FOO has value 1;2;3

# ----------------------------
# list expansion demo
set(my_list u v w)
set(target "GLOBAL") #doesn't need quotes, but just showing that this works

set_property(
    "${target}"
    PROPERTY BAR
    ${my_list} #list expansion should be done without quotes
)
get_cmake_property(out_var2 BAR)
message(STATUS "property bar: ${out_var2}")

# ----------------------------
set_property(
    DIRECTORY
    PROPERTY DIR_PROP1
    this
    is
    dir_prop
)
get_property(dir_out_var DIRECTORY PROPERTY DIR_PROP1) #notice lack of cmake_ prefix, this gets directory property
message(STATUS "dir property: ${dir_out_var}")


message(STATUS "\n\n")







# ----------------------------
# functions
# ----------------------------
function(my_function)
    message(STATUS "Hello, I am function")
endfunction()

my_function() #call function

message(STATUS "\n\n")
# ----------------------------
function(argFunction arg1)
    message(STATUS "Hello, I am function; you gave me ${arg1}")
endfunction()

argFunction("BYE")

set(x "the x value")
argFunction(x)      #-- Hello, I am function; you gave me x
argFunction("${x}")   #-- Hello, I am function; you gave me the x value
#argFunction(${x})   #this has desired output, but it is using a list expansion

message(STATUS "\n\n")
# ----------------------------
function(multiArgFunc a b c)
    message(STATUS "${a} ${b} ${c}")
endfunction()

multiArgFunc(9, 8, 7)

set(a_list 1 2 3)
multiArgFunc(${a_list}) #use list expansion to pass arguments

message(STATUS "\n\n")
# ----------------------------

function(variadicFunc FIRST)
    message(STATUS "printing unnamed args")
    foreach(arg IN LISTS ARGN)
        message(STATUS "${arg}")
    endforeach()

    message(STATUS "\nprinting NAMED args")
    foreach(all_args IN LISTS ARGV)
        message(STATUS "${all_args}")
    endforeach()
endfunction()

variadicFunc(joe doe lily smoe)

# ----------------------------
# SCOPE
# ----------------------------
function(scopeDemoFunc)
    #functions will copy the varaibles at global scope and make them local scope
    #this is done at the time of calling, notice global var is not defined!
    message(STATUS "global var: ${MY_GLOBAL_VAR}")

    #overwriting just overwrites the local function scope copy
    set(MY_GLOBAL_VAR "mmm")
endfunction()

set(MY_GLOBAL_VAR "ouch")

scopeDemoFunc() #will copy and then change its local copy, so ouch will be printed the second time
message(STATUS "globar var did not change: ${MY_GLOBAL_VAR}")

# ----------------------------
# creating return values for functions 

#there'se no out vars, you must specify parent scope

set(retVal 5)
function(retValFunc newVAL)
    set(retVal "${newVAL}" PARENT_SCOPE)
endfunction()

retValFunc(11)
message(STATUS "${retVal}")

retValFunc(321)
message(STATUS "${retVal}")


# ----------------------------
# how to do an out-var
function(increment var)
    message(STATUS "value before increment ${${var}}") #first deference gets variable name, second deference gets value
    math(EXPR localVar "${${var}} + 1")
    set("${var}" "${localVar}" PARENT_SCOPE)
endfunction()

set(myValue 5)
increment(myValue)
message(STATUS "value after increment ${myValue}")

# ----------------------------

function(namedArgFunction)
    set(options PRINT_HI)
    set(args NAME SRC)
    set(list_args ARGVs)
    cmake_parse_arguments(      
        PARSE_ARGV 0                #MODE, numArgsToSkip
        test                        #variable prefix
        "${options}"                #list of options for our parse (these are custom that we can provide); they're boolean values
        "${args}"                   #the keyword arguments to find (we're going to pass NAME and SRC)
        "${list_args}"              #keyword associated with more than one value
    )

    #cmake_parse_arguments will create a list of arguments it did not parse; prefixed with the giving prefix
    foreach(arg IN LISTS test_UNPARSED_ARGUMENTS)
        message(STATUS "unparsed ${arg}") 
    endforeach()

    #parsed arguments get the prefix appended before the variable name
    message(STATUS "NAME is ${test_NAME}")  
    message(STATUS "SRC is ${test_SRC}")    
    message(STATUS "TEST_ARGV is ${test_ARGVs}")
    if(test_PRINT_HI)
        message(STATUS "HI! You passed this option :3")
    endif()
endfunction()

#-- unparsed EXTRA
#-- unparsed lol
#-- text NAME is blue
#-- text SRC is brain
#-- TEST_ARGV is one;two;three
#-- HI! You passed this option :3
namedArgFunction(
    NAME "blue"
    SRC "brain"
    EXTRA "lol"
    PRINT_HI                    #this is an option
    ARGVs "one" two "three"
)

message(STATUS "\n\n\n\n")
# ----------------------------
if(DEFINED a_var)
    message(STATUS "a_var is defined")
else()
    message(STATUS "a_var is NOT defined")
endif()

set(a_var 11)

if(DEFINED a_var)
    message(STATUS "a_var is defined")
else()
    message(STATUS "a_var is NOT defined")
endif()


# ----------------------------
# ----------------------------
# ----------------------------
# ----------------------------
# ----------------------------

message(STATUS "\n\n\n")