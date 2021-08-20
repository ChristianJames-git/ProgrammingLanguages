cmake_minimum_required(VERSION 3.17)
project(IntArray)

set(CMAKE_CXX_STANDARD 14)

add_executable(intArray intArray.cpp intArray.h)

add_executable(Test Test.cpp Test.h)

add_executable(KraftTest iadrv.cpp iadrv.h intArray)