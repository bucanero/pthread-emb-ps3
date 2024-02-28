project(pthread)

# Set cleanup type (default to C)
set(CLEANUP_TYPE C)

## Set the C and C++ compilers
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

set(THREAD_OBJS
        src/create.c
        src/pthread_self.c
        src/pthread_equal.c
        src/pthread_join.c
        src/pthread_detach.c
        src/pte_detach.c
        src/pte_callUserDestroyRoutines.c
        src/pte_tkAssocDestroy.c
        src/pthread_kill.c
        src/pthread_attr_destroy.c
        src/pthread_attr_getdetachstate.c
        src/pthread_attr_getinheritsched.c
        src/pthread_attr_getschedparam.c
        src/pthread_attr_getschedpolicy.c
        src/pthread_attr_getscope.c
        src/pthread_attr_getstackaddr.c
        src/pthread_attr_getstacksize.c
        src/pthread_attr_init.c
        src/pthread_attr_setdetachstate.c
        src/pthread_attr_setinheritsched.c
        src/pthread_attr_setschedparam.c
        src/pthread_attr_setschedpolicy.c
        src/pthread_attr_setscope.c
        src/pthread_attr_setstackaddr.c
        src/pthread_attr_setstacksize.c
        src/pte_is_attr.c
        src/pthread_exit.c
        src/pthread_getschedparam.c
        src/pthread_setschedparam.c
        src/sched_get_priority_max.c
        src/sched_get_priority_min.c
)

set(TLS_OBJS
        src/pthread_key_create.c
        src/pthread_key_delete.c
        src/pthread_getspecific.c
        src/pthread_setspecific.c
        src/pte_tkAssocCreate.c
)
set(MISC_OBJS
        src/sched_yield.c
        src/pthread_delay_np.c
        src/pthread_testcancel.c
        src/pte_throw.c
        src/cleanup.c
        src/pthread_once.c
        src/pthread_num_processors_np.c
        src/pte_getprocessors.c
        src/pte_spinlock_check_need_init.c
        src/global.c
        src/pthread_timechange_handler_np.c
        src/pte_cond_check_need_init.c
        src/pthread_getconcurrency.c
        src/pthread_setconcurrency.c
        src/pte_cancellable_wait.c
)
set(SEM_OBJS
        src/sem_close.c
        src/sem_destroy.c
        src/sem_getvalue.c
        src/sem_init.c
        src/sem_open.c
        src/sem_post.c
        src/sem_post_multiple.c
        src/sem_timedwait.c
        src/sem_trywait.c
        src/sem_unlink.c
        src/sem_wait.c
)
set(BARRIER_OBJS
        src/pthread_barrier_init.c
        src/pthread_barrier_destroy.c
        src/pthread_barrier_wait.c
        src/pthread_barrierattr_init.c
        src/pthread_barrierattr_destroy.c
        src/pthread_barrierattr_getpshared.c
        src/pthread_barrierattr_setpshared.c
)

set(SPIN_OBJS
        src/pthread_spin_destroy.c
        src/pthread_spin_init.c
        src/pthread_spin_lock.c
        src/pthread_spin_trylock.c
        src/pthread_spin_unlock.c
)

set(CONDVAR_OBJS
        src/pthread_cond_destroy.c
        src/pthread_cond_init.c
        src/pthread_cond_signal.c
        src/pthread_cond_wait.c
        src/pthread_condattr_destroy.c
        src/pthread_condattr_getpshared.c
        src/pthread_condattr_init.c
        src/pthread_condattr_setpshared.c
)

set(RWLOCK_OBJS
        src/pthread_rwlock_init.c
        src/pthread_rwlock_destroy.c
        src/pthread_rwlock_rdlock.c
        src/pthread_rwlock_timedrdlock.c
        src/pthread_rwlock_timedwrlock.c
        src/pthread_rwlock_tryrdlock.c
        src/pthread_rwlock_trywrlock.c
        src/pthread_rwlock_unlock.c
        src/pthread_rwlock_wrlock.c
        src/pthread_rwlockattr_init.c
        src/pthread_rwlockattr_destroy.c
        src/pthread_rwlockattr_getpshared.c
        src/pthread_rwlockattr_setpshared.c
        src/pte_rwlock_check_need_init.c
        src/pte_rwlock_cancelwrwait.c
)

set(CANCEL_OBJS
        src/pthread_cancel.c
        src/pthread_setcanceltype.c
        src/pthread_setcancelstate.c
)

set(OS_OBJS
        src/platform/psl1ght/psl1ght_osal.c
        src/platform/helper/tls-helper.c
)

# Define target
add_library(pthread STATIC
        ${MUTEX_OBJS}
        ${MUTEXATTR_OBJS}
        ${SUPPORT_OBJS}
        ${THREAD_OBJS}
        ${TLS_OBJS}
        ${MISC_OBJS}
        ${SEM_OBJS}
        ${BARRIER_OBJS}
        ${SPIN_OBJS}
        ${CONDVAR_OBJS}
        ${RWLOCK_OBJS}
        ${CANCEL_OBJS}
        ${OS_OBJS}
)

# Include directories
target_include_directories(pthread PUBLIC
        src/platform
        src/platform/helper
        src/platform/psl1ght
)

# Compiler flags
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O2 -Wall -g -fno-strict-aliasing")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O2 -Wall -g -fno-strict-aliasing -fexceptions -fno-rtti -Werror -D__CLEANUP_CXX")

# Add include directories
include_directories(
        src
        /ps3dev/ppu/include/
)

# Link libraries
target_link_libraries(pthread PRIVATE -lm -Wl,--export-dynamic)

set(INSTALL_LIB_DIR "/ps3dev/ppu/lib")

# Installation
install(TARGETS pthread DESTINATION ${INSTALL_LIB_DIR})

# Specify the files you want to install
set(INSTALL_FILES
        "src/platform/psp/pte_types.h"
        "src/pthread.h"
        "src/semaphore.h"
        "src/sched.h"
)

# Specify the directory where you want to install the files
set(INSTALL_INCLUDE_DIR "/ps3dev/ppu/include") # Change bin to your desired directory

# Copy files during installation
foreach (file ${INSTALL_FILES})
    install(FILES ${file} DESTINATION ${INSTALL_INCLUDE_DIR})
endforeach ()


# List of files installed during installation
set(INSTALLED_FILES
        "${INSTALL_INCLUDE_DIR}/pte_types.h"
        "${INSTALL_INCLUDE_DIR}/pthread.h"
        "${INSTALL_INCLUDE_DIR}/semaphore.h"
        "${INSTALL_INCLUDE_DIR}/sched.h"
        "${INSTALL_LIB_DIR}/libpthread.a"
)

# Generate cmake_uninstall.cmake
configure_file(
        "${CMAKE_CURRENT_SOURCE_DIR}/cmake_uninstall.cmake.in"
        "${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake"
        IMMEDIATE @ONLY
)

# Add an uninstall target
add_custom_target(uninstall
        COMMAND ${CMAKE_COMMAND} -P ${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake
)

# Mark the uninstall target as a pseudo-dependency of the build target
add_dependencies(pthread uninstall)