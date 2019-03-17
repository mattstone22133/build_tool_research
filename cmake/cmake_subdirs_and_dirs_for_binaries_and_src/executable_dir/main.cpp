#include<iostream>
#include "HelloLib/hello.hpp"

int main()
{
    helloNS::hello();

    std::cout << "Preprocess macro from the library:" << HELLO_LIB_VERSION << std::endl;
}