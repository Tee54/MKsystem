ENTRY(_start)

SECTIONS
{
    . =1M;
    
    .boot : ALIGN(8) {
        *(.multiboot)
}

    .text : ALIGN(4k) {
        *(.text)
}
    
    .bss : ALIGN(4k) {
        *(.bss COMMON)
}
}
