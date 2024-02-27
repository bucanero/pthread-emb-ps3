cmake_minimum_required(VERSION 3.10)
project(libpthread)

# Set cleanup type (default to C)
set(CLEANUP_TYPE C)

# Set the C and C++ compilers
set(CMAKE_C_COMPILER ppu-gcc)
set(CMAKE_CXX_COMPILER ppu-g++)

# Source files
set(MUTEX_OBJS
        pthread_mutex_unlock.c
        pthread_mutex_init.c
        pthread_mutex_destroy.c
        pthread_mutex_lock.c
        pthread_mutex_timedlock.c
        pthread_mutex_trylock.c
)

set(MUTEXATTR_OBJS
        pthread_mutexattr_destroy.c
        pthread_mutexattr_getkind_np.c
        pthread_mutexattr_getpshared.c
        pthread_mutexattr_gettype.c
        pthread_mutexattr_init.c
        pthread_mutexattr_setkind_np.c
        pthread_mutexattr_setpshared.c
        pthread_mutexattr_settype.c
)

set(SUPPORT_OBJS
        pte_relmillisecs.c
        pte_mutex_check_need_init.c
        pte_threadDestroy.c
        pte_new.c
        pte_threadStart.c
        global.c
        pte_reuse.c
        pthread_init.c
        pthread_terminate.c
)

# Define target
add_library(libpthread STATIC
        ${MUTEX_OBJS}
        ${MUTEXATTR_OBJS}
        ${SUPPORT_OBJS}
)

# Include directories
target_include_directories(libpthread PUBLIC
        platform/helper
        platform/psl1ght
)

# Compiler flags
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -G0 -O2 -Wall -g -fno-strict-aliasing")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -G0 -O2 -Wall -g -fno-strict-aliasing -fexceptions -fno-rtti -Werror -D__CLEANUP_CXX")

# Add include directories
include_directories(
        .
        /ps3dev/ppu/include/
)


# Link libraries
target_link_libraries(libpthread PRIVATE -lm)

# Installation
install(TARGETS libpthread DESTINATION /ps3dev/ppu/lib)

# Specify the files you want to install
set(INSTALL_FILES
        "platform/psp/pte_types.h"
        "pthread.h"
        "semaphore.h"
        "sched.h"
)
# Specify the directory where you want to install the files
set(INSTALL_DIR "/ps3dev/ppu/include/") # Change bin to your desired directory

# Copy files during installation
foreach(file ${INSTALL_FILES})
    install(FILES ${file} DESTINATION ${INSTALL_DIR})
endforeach()