function(print_cmake_vars)
    message(STATUS "cmake SOURCE dir                         : ${CMAKE_SOURCE_DIR}")
    message(STATUS "cmake BINARY dir                         : ${CMAKE_BINARY_DIR}")
    message(STATUS "SOURCE dir for project ${PROJECT_NAME}   : ${PROJECT_SOURCE_DIR}")
    message(STATUS "BINARY dir for project ${PROJECT_NAME}   : ${PROJECT_BINARY_DIR}")
    message(STATUS "current project version                  : ${PROJECT_VERSION}")
    message(STATUS "current SOURCE dir                       : ${CMAKE_CURRENT_SOURCE_DIR}")
    message(STATUS "current BINARY dir                       : ${CMAKE_CURRENT_BINARY_DIR}")
    message(STATUS "current script file                      : ${CMAKE_CURRENT_LIST_FILE}")
    message(STATUS "current script dir                       : ${CMAKE_CURRENT_LIST_DIR}")
endfunction()