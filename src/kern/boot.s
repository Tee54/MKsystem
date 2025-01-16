#Licence

.global _start
.type _start, @function

.section .bss
.align 16
stack_top:
.skip 16384 #16 Kib
stack_bottom:

.section .text
_start:
    #SET LITTLE STACK
    mov $stack_top, %rbp

    #HARDWARE CHECK (LATER)
    #INIT PAGING
    push %rbp 
    mov %rsp, rbp
    call init_paging

    pop %rbp

    #INIT GTD

    #INIT LONG MODE

    #CALL FOR THE CPU BASIC INFORMATION: MEMORY

    call kernel_main

    hlt
