happy: happy.o
	ld -m elf_i386 happy.o -o happy

happy.o: happy.s
	nasm -f elf32 happy.s -o happy.o
