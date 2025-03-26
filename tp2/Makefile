hello: hello.o
	ld -m elf_i386 hello.o -o hello

hello.o: 01_hello/hello.s
	nasm -f elf32 01_hello/hello.s -o hello.o

happy: happy.o
	ld -m elf_i386 happy.o -o happy

happy.o: 02_happy/happy.s
	nasm -f elf32 02_happy/happy.s -o happy.o

num2str: num2str.o
	ld -m elf_i386 num2str.o -o num2str

num2str.o: 03_num2str/num2str.s
	nasm -f elf32 03_num2str/num2str.s -o num2str.o
