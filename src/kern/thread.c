//License

#include "include/kern/stack.h"

struct thread {
    int id;
    int prio;
    int state;
    int stack;
    int heap;
    int IO;
    int task;
};

    void init_thread() {}

    void create_thread() {}

    void kill_thread() {}
