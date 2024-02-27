cmake_minimum_required(VERSION 3.10)
project(MyProject)

# Set the C and C++ compilers
set(CMAKE_C_COMPILER ppu-gcc)
set(CMAKE_CXX_COMPILER ppu-g++)

# Add executable
add_executable(my_program main.cpp)

# Add include directories
include_directories(
/ps3dev/ppu/include
)

# Add library directories
link_directories(
/ps3dev/ppu/lib
)

# Link pthread library
target_link_libraries(my_program PRIVATE -lpthread )
