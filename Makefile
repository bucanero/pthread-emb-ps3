docker-build:
	docker run -i --rm -v `pwd`:/src -w /src hldtux/ps3dev bash -c "make cmake-build"

docker-run:
	docker run -it --rm -v `pwd`:/src -w /src hldtux/ps3dev bash

cmake-build:
	(mkdir -p build-cmake && cd build-cmake && cmake -Wno-dev .. && make) && echo CPP CMAKE OK

cmake-install:	cmake-build
	cd build-cmake && make install

cmake-uninstall:
	cd build-cmake && make uninstall

meson-build-ppu:
	(meson setup --reconfigure --cross-file ps3-ppu.txt -Dps3dev=${PS3DEV} build-ppu-meson && meson compile -C build-ppu-meson) && echo CPP MESON PPU OK

meson-build-spu:
	(meson setup --reconfigure --cross-file ps3-spu.txt -Dps3dev=${PS3DEV} build-spu-meson && meson compile -C build-spu-meson) && echo CPP MESON SPU OK

meson-install-ppu:	meson-build-ppu
	cd build-ppu-meson && meson install

meson-install-spu:	meson-build-spu
	cd build-spu-meson && meson install

meson-install:	meson-build-ppu

meson-uninstall: meson-uninstall-ppu	meson-uninstall-spu

meson-uninstall-ppu:
	rm -f ${PS3DEV}/ppu/lib/libpthread.a \
	${PS3DEV}/ppu/include/pte_types.h \
	${PS3DEV}/ppu/include/pthread.h \
	${PS3DEV}/ppu/include/semaphore.h \
	${PS3DEV}/ppu/include/sched.h

meson-uninstall-spu:
	rm -f ${PS3DEV}/spu/lib/libpthread.a \
	${PS3DEV}/spu/include/pte_types.h \
	${PS3DEV}/spu/include/pthread.h \
	${PS3DEV}/spu/include/semaphore.h \
	${PS3DEV}/spu/include/sched.h

clean:
	rm -rf build-*