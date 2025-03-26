hello: hello.o
	ld -m elf_i386 hello.o -o hello

hello.o: hello.s
	nasm -f elf32 hello.s -o hello.o
