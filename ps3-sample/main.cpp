#include <iostream>
extern "C" {
#include <pthread.h>
}

void* thread_function(void* arg) {
    std::cout << "Hello from thread\n";
    return nullptr;
}

int main() {
    pthread_t thread_id;
    pthread_create(&thread_id, nullptr, thread_function, nullptr);
    pthread_join(thread_id, nullptr);
    std::cout << "Back in main thread\n";
    return 0;
}
