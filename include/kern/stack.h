//License 
    
#include <src/kern/stack.c>

    void init_stack(int base_region, int top_region);

    int pop_stack(int pframe, int top_region);

    void push_stack(int pframe, int push_value, int top_region);

    int peer_stack(int pframe, int top_region);

    void release_stack();

    void init_bootstrap_stack();

    void release_bootstrap_stack();
