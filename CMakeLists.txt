cmake_minimum_required(VERSION 3.10)
project(libpthread)

# Set cleanup type (default to C)
set(CLEANUP_TYPE C)

# Set the C and C++ compilers
set(CMAKE_C_COMPILER ppu-gcc)
set(CMAKE_CXX_COMPILER ppu-g++)

# Source files
set(MUTEX_OBJS
        src/pthread_mutex_unlock.c
        src/pthread_mutex_init.c
        src/pthread_mutex_destroy.c
        src/pthread_mutex_lock.c
        src/pthread_mutex_timedlock.c
        src/pthread_mutex_trylock.c
        src/pthread-atfork.c
)

set(MUTEXATTR_OBJS
        src/pthread_mutexattr_destroy.c
        src/pthread_mutexattr_getkind_np.c
        src/pthread_mutexattr_getpshared.c
        src/pthread_mutexattr_gettype.c
        src/pthread_mutexattr_init.c
        src/pthread_mutexattr_setkind_np.c
        src/pthread_mutexattr_setpshared.c
        src/pthread_mutexattr_settype.c
)

set(SUPPORT_OBJS
        src/pte_relmillisecs.c
        src/pte_mutex_check_need_init.c
        src/pte_threadDestroy.c
        src/pte_new.c
        src/pte_threadStart.c
        src/global.c
        src/pte_reuse.c
        src/pthread_init.c
        src/pthread_terminate.c
)

# Define target
add_library(libpthread STATIC
        ${MUTEX_OBJS}
        ${MUTEXATTR_OBJS}
        ${SUPPORT_OBJS}
)

# Include directories
target_include_directories(libpthread PUBLIC
        src/platform/helper
        src/platform/psl1ght
)

# Compiler flags
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -G0 -O2 -Wall -g -fno-strict-aliasing")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -G0 -O2 -Wall -g -fno-strict-aliasing -fexceptions -fno-rtti -Werror -D__CLEANUP_CXX")

# Add include directories
include_directories(
        src
        /ps3dev/ppu/include/
)


# Link libraries
target_link_libraries(libpthread PRIVATE -lm)

# Installation
install(TARGETS libpthread DESTINATION /ps3dev/ppu/lib)

# Specify the files you want to install
set(INSTALL_FILES
        "src/platform/psp/pte_types.h"
        "src/pthread.h"
        "src/semaphore.h"
        "src/sched.h"
)
# Specify the directory where you want to install the files
set(INSTALL_DIR "/ps3dev/ppu/include/") # Change bin to your desired directory

# Copy files during installation
foreach(file ${INSTALL_FILES})
    install(FILES ${file} DESTINATION ${INSTALL_DIR})
endforeach()