#Licence

.global _start
.type _start, @function

.section .text
_start:
    #HARDWARE CHECK

    #INIT PAGING: CALL THE MMU

    #INIT GTD

    #INIT LONG MODE

    call init_bootstrap_stack

    #CALL FOR THE CPU BASIC INFORMATION: MEMORY

    call kernel_main

    hlt

OOPS:
    #Oops!
    movw $0x024f, 0xb8000
    movw $0x026f, 
    movw $0x0270,
    movw $0x0273,
    movw $0x0221,

    hlt
    ret
