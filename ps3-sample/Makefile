example:	native	cmake	meson

native:
	ppu-gcc main.c -o main_c -lpthread -I ${PS3DEV}/ppu/include -L ${PS3DEV}/ppu/lib && echo C OK
	ppu-g++ main.cpp -o main_cpp -lpthread -I ${PS3DEV}/ppu/include -L ${PS3DEV}/ppu/lib && echo CPP OK

cmake:
	(mkdir -p build-cmake && cd build-cmake && cmake .. -Wno-dev && make) && echo CPP CMAKE OK

meson:
	(meson setup --cross-file ps3.txt build-meson && meson compile -C build-meson) && echo CPP MESON OK

clean:
	rm -rf main_c main_cpp build-*