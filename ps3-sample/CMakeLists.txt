project(ps3-sample)

# Set the C and C++ compilers
set(CMAKE_C_COMPILER ppu-gcc)
set(CMAKE_CXX_COMPILER ppu-g++)

# Add executable
add_executable(ps3-sample main.cpp)

# Add include directories
include_directories(/ps3dev/ppu/include)

# Add library directories
link_directories(/ps3dev/ppu/lib)

# Link pthread library
target_link_libraries(ps3-sample PRIVATE -lpthread)
