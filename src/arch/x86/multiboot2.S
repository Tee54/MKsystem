//License

#define MULTI2_MAGIC 0xe85250d6
#define MULTI2_ARCH 0
#define MULTI2_LENGTH (multiboot_header_start - multiboot_header_end)
#define MULTI2_CHECKSUM 0x100000000 -(MULTI2_MAGIC + MULTI2_ARCH + MULTI2_LENGTH)

.section .multiboot
.align 8
multiboot_header_start:
    .long MULTI2_MAGIC
    .long MULTI2_ARCH
    .long MULTI2_LENGTH
    .long MULTI2_CHECKSUM
/*
    //memory information
    .short 4
    .short 0
    .long 8

    //framebuffer
    .short 5
    .short 0
    .long 8

    //align modules
    .short 6
    .short 0
    .long 8
*/
    //end tag
    .short 0
    .short 0
    .long 8
multiboot_header_end:
