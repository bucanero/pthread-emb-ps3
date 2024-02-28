project('pthread', 'c', version: '1.0.0')

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

# Define sources
thread_objs = [
    'src/create.c',
    'src/pthread_self.c',
    'src/pthread_equal.c',
    'src/pthread_join.c',
    'src/pthread_detach.c',
    'src/pte_detach.c',
    'src/pte_callUserDestroyRoutines.c',
    'src/pte_tkAssocDestroy.c',
    'src/pthread_kill.c',
    'src/pthread_attr_destroy.c',
    'src/pthread_attr_getdetachstate.c',
    'src/pthread_attr_getinheritsched.c',
    'src/pthread_attr_getschedparam.c',
    'src/pthread_attr_getschedpolicy.c',
    'src/pthread_attr_getscope.c',
    'src/pthread_attr_getstackaddr.c',
    'src/pthread_attr_getstacksize.c',
    'src/pthread_attr_init.c',
    'src/pthread_attr_setdetachstate.c',
    'src/pthread_attr_setinheritsched.c',
    'src/pthread_attr_setschedparam.c',
    'src/pthread_attr_setschedpolicy.c',
    'src/pthread_attr_setscope.c',
    'src/pthread_attr_setstackaddr.c',
    'src/pthread_attr_setstacksize.c',
    'src/pte_is_attr.c',
    'src/pthread_exit.c',
    'src/pthread_getschedparam.c',
    'src/pthread_setschedparam.c',
    'src/sched_get_priority_max.c',
    'src/sched_get_priority_min.c',
]

tls_objs = [
    'src/pthread_key_create.c',
    'src/pthread_key_delete.c',
    'src/pthread_getspecific.c',
    'src/pthread_setspecific.c',
    'src/pte_tkAssocCreate.c',
]

misc_objs = [
    'src/sched_yield.c',
    'src/pthread_delay_np.c',
    'src/pthread_testcancel.c',
    'src/pte_throw.c',
    'src/cleanup.c',
    'src/pthread_once.c',
    'src/pthread_num_processors_np.c',
    'src/pte_getprocessors.c',
    'src/pte_spinlock_check_need_init.c',
    'src/global.c',
    'src/pthread_timechange_handler_np.c',
    'src/pte_cond_check_need_init.c',
    'src/pthread_getconcurrency.c',
    'src/pthread_setconcurrency.c',
    'src/pte_cancellable_wait.c',
]

sem_objs = [
    'src/sem_close.c',
    'src/sem_destroy.c',
    'src/sem_getvalue.c',
    'src/sem_init.c',
    'src/sem_open.c',
    'src/sem_post.c',
    'src/sem_post_multiple.c',
    'src/sem_timedwait.c',
    'src/sem_trywait.c',
    'src/sem_unlink.c',
    'src/sem_wait.c',
]

barrier_objs = [
    'src/pthread_barrier_init.c',
    'src/pthread_barrier_destroy.c',
    'src/pthread_barrier_wait.c',
    'src/pthread_barrierattr_init.c',
    'src/pthread_barrierattr_destroy.c',
    'src/pthread_barrierattr_getpshared.c',
    'src/pthread_barrierattr_setpshared.c',
]

spin_objs = [
    'src/pthread_spin_destroy.c',
    'src/pthread_spin_init.c',
    'src/pthread_spin_lock.c',
    'src/pthread_spin_trylock.c',
    'src/pthread_spin_unlock.c',
]

condvar_objs = [
    'src/pthread_cond_destroy.c',
    'src/pthread_cond_init.c',
    'src/pthread_cond_signal.c',
    'src/pthread_cond_wait.c',
    'src/pthread_condattr_destroy.c',
    'src/pthread_condattr_getpshared.c',
    'src/pthread_condattr_init.c',
    'src/pthread_condattr_setpshared.c',
]

rwlock_objs = [
    'src/pthread_rwlock_init.c',
    'src/pthread_rwlock_destroy.c',
    'src/pthread_rwlock_rdlock.c',
    'src/pthread_rwlock_timedrdlock.c',
    'src/pthread_rwlock_timedwrlock.c',
    'src/pthread_rwlock_tryrdlock.c',
    'src/pthread_rwlock_trywrlock.c',
    'src/pthread_rwlock_unlock.c',
    'src/pthread_rwlock_wrlock.c',
    'src/pthread_rwlockattr_init.c',
    'src/pthread_rwlockattr_destroy.c',
    'src/pthread_rwlockattr_getpshared.c',
    'src/pthread_rwlockattr_setpshared.c',
    'src/pte_rwlock_check_need_init.c',
    'src/pte_rwlock_cancelwrwait.c',
]

cancel_objs = [
    'src/pthread_cancel.c',
    'src/pthread_setcanceltype.c',
    'src/pthread_setcancelstate.c',
]

os_objs = [
    'src/platform/psl1ght/psl1ght_osal.c',
    'src/platform/helper/tls-helper.c',
]

source_files = mutex_objs + mutexattr_objs + support_objs + thread_objs + tls_objs + misc_objs + sem_objs + barrier_objs + spin_objs + condvar_objs + rwlock_objs + cancel_objs + os_objs

# Define target
install_dir = '/ps3dev/ppu/lib'
libpthread = static_library('pthread',
                            sources: source_files,
                            include_directories : ['/ps3dev/ppu/include', 'src', 'src/platform/helper', 'src/platform/psl1ght'],
                            install: true,
                            install_dir: install_dir,
                            )

## Installation
# Define files to install
install_files = [
    'src/platform/psl1ght/pte_types.h',
    'src/pthread.h',
    'src/semaphore.h',
    'src/sched.h'
]

# Copy files during installation
foreach file : install_files
    install_data(file, install_dir : '/ps3dev/ppu/include')
endforeach
