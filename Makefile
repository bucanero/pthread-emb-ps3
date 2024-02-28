docker-build:
	docker run -i --rm -v `pwd`:/src hldtux/ps3dev bash -c "make cmake-build"

docker-run:
	docker run -it --rm -v `pwd`:/src hldtux/ps3dev bash

cmake-build:
	(mkdir -p build-cmake && cd build-cmake && cmake -Wno-dev .. && make) && echo CPP CMAKE OK

cmake-install:	cmake-build
	cd build-cmake && make install

cmake-uninstall:
	cd build-cmake && make uninstall

meson-build:
	(meson setup --cross-file ps3.txt build-meson && meson compile -C build-meson) && echo CPP MESON OK

meson-install:	meson-build
	cd build-meson && meson install

meson-uninstall:
	rm -f ${PS3DEV}/ppu/lib/libthread.a \
	${PS3DEV}/ppu/include/pte_types.h \
	${PS3DEV}/ppu/include/pthread.h \
	${PS3DEV}/ppu/include/semaphore.h \
	${PS3DEV}/ppu/include/sched.h

clean:
	rm -rf build-*