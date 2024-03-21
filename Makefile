all:
	nasm -f elf32 -o kalkulator.o kalkulator.asm
	ld -m elf_i386 -o kalkulator kalkulator.o