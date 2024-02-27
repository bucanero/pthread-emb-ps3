project('libpthread', 'c', version: '1.0.0',
        default_options: ['c_std=gnu99', 'cpp_std=c++11'],
)

# Define source files
mutex_objs = [
    'src/pthread_mutex_unlock.c',
    'src/pthread_mutex_init.c',
    'src/pthread_mutex_destroy.c',
    'src/pthread_mutex_lock.c',
    'src/pthread_mutex_timedlock.c',
    'src/pthread_mutex_trylock.c',
    'src/pthread-atfork.c'
]

mutexattr_objs = [
    'src/pthread_mutexattr_destroy.c',
    'src/pthread_mutexattr_getkind_np.c',
    'src/pthread_mutexattr_getpshared.c',
    'src/pthread_mutexattr_gettype.c',
    'src/pthread_mutexattr_init.c',
    'src/pthread_mutexattr_setkind_np.c',
    'src/pthread_mutexattr_setpshared.c',
    'src/pthread_mutexattr_settype.c'
]

support_objs = [
    'src/pte_relmillisecs.c',
    'src/pte_mutex_check_need_init.c',
    'src/pte_threadDestroy.c',
    'src/pte_new.c',
    'src/pte_threadStart.c',
    'src/global.c',
    'src/pte_reuse.c',
    'src/pthread_init.c',
    'src/pthread_terminate.c'
]


# Define target
libpthread = static_library('libpthread',
                            mutex_objs + mutexattr_objs + support_objs,
                            include_directories : ['/ps3dev/ppu/include/', 'src', 'src/platform/psl1ght'])

# Installation
install_dir = '/ps3dev/ppu/lib'

# Define files to install
install_files = [
    'src/platform/psp/pte_types.h',
    'src/pthread.h',
    'src/semaphore.h',
    'src/sched.h'
]

# Copy files during installation
foreach file : install_files
    install_data(file, install_dir : '/ps3dev/ppu/include/')
endforeach