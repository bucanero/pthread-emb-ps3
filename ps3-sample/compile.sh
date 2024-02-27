ppu-g++ main.cpp -o main_cpp -lpthread -I $PS3DEV/ppu/include/ -L $PS3DEV/ppu/lib/ && echo CPP OK
ppu-gcc main.c -o main_c -lpthread -I $PS3DEV/ppu/include/ -L $PS3DEV/ppu/lib/ && echo C OK
(mkdir -p build && cd build && cmake -DCMAKE_C_COMPILER=ppu-gcc -DCMAKE_CXX_COMPILER=ppu-g++ .. && make) && echo CPP CMAKE OK