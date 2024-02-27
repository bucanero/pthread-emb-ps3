cmake_minimum_required(VERSION 3.10)
project(MyProject)

# Find pthread library
find_package(Threads REQUIRED)

# Add executable
add_executable(my_program main.cpp)

# Add include directories
include_directories(
/ps3dev/ppu/include/
)

# Link pthread library
target_link_libraries(my_program PRIVATE Threads::Threads)
