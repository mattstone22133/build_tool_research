#include<iostream>
#include"hello.hpp"

void helloNS::hello()
{
    std::cout << "Hello World, I'm in a library :3" << std::endl;
}