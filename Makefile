
all:	cmake	meson

cmake:
	(mkdir -p build-cmake && cd build-cmake && cmake .. && make) && echo CPP CMAKE OK

cmake-install:	cmake
	cd build-cmake && make install

meson:
	(meson setup --cross-file ps3.txt build-meson && meson compile -C build-meson) && echo CPP MESON OK

meson-install:	meson
	cd build-meson && meson install

install: meson-install

clean:
	rm -rf main_c main_cpp build_cmake build_meson