#Makefile by: Ciro Dario

#tools
GCC = ~/opt/cross-x86/bin/x86_64-elf-gcc 
LD = ~/opt/cross-x86/bin/x86_64-elf-ld 
AS = ~/opt/cross-x86/bin/x86_64-elf-as 

#flags
CFLAGS = -ffreestanding -Wall -std=gnu99 -O2 -Wextra
LDFLAGS = -T linker.ld -n -ffreestanding -O2 -nostdlib

### ASK FOR ARCH LEARN HOW TO MAKE SHELL SCRIPTS BETTER

#files
ARCH = src/arch/x86
SRC = src/kern
OBJ = boot.o multiboot2.o kern.o

#rules
all: kernel.bin

kernel.bin: $(OBJ)
	$(GCC) $(LDFLAGS) -o kernel.bin $(OBJ) -lgcc 
	$(MAKE) check_multiboot2 END=$@

boot.o: $(SRC)/boot.s
	$(AS) $(SRC)/boot.s -o boot.o

multiboot2.o: $(ARCH)/multiboot2.S
	$(GCC) -c $< -o $@

kern.o: $(SRC)/main.c
	$(GCC) -c $(SRC)/kern.c -o kern.o $(CFLAGS)

clean:
	rm -f $(OBJ) kernel.bin

#make iso with xorriso LATER 
OS.iso: kernel.bin
	mkdir -p build/boot/grub
	cp kernel.bin build/boot/
	cp tools/grub.cfg build/boot/grub/
	grub-mkrescue -o $@ build/

###FOR SCRIPT 

check_multiboot2: 
	@if grub-file --is-x86-multiboot2 $(END); then \
		echo "The kernel is valid!"; \
	else \
		echo "Error: is not multiboot2 compliant, try again"; \
	fi

