project('ps3-sample', 'cpp', version: '1.0.0',)

# Add include directories
add_global_arguments('-I/ps3dev/ppu/include', language : 'cpp')

# Add library directories
add_global_link_arguments('-L/ps3dev/ppu/lib', language : 'cpp')

# Link pthread library
ps3_libs = ['-lpthread']
executable('ps3-sample', 'main.cpp', link_args: ps3_libs)


