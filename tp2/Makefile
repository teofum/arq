# Function library targets

num2str.o: lib/num2str.s
	nasm -f elf32 lib/num2str.s -o num2str.o

sum.o: lib/sum.s
	nasm -f elf32 lib/sum.s -o sum.o

syscall.o: lib/syscall.s
	nasm -f elf32 lib/syscall.s -o syscall.o

# Binary targets

hello: 01_hello.o syscall.o
	ld -m elf_i386 01_hello.o syscall.o -o hello

01_hello.o: 01_hello/hello.s
	nasm -f elf32 01_hello/hello.s -o 01_hello.o

happy: 02_happy.o syscall.o
	ld -m elf_i386 02_happy.o syscall.o -o happy

02_happy.o: 02_happy/happy.s
	nasm -f elf32 02_happy/happy.s -o 02_happy.o

num2str: 03_num2str.o num2str.o syscall.o
	ld -m elf_i386 03_num2str.o num2str.o syscall.o -o num2str

03_num2str.o: 03_num2str/num2str.s
	nasm -f elf32 03_num2str/num2str.s -o 03_num2str.o

sum: 04_sum.o sum.o num2str.o syscall.o
	ld -m elf_i386 04_sum.o sum.o num2str.o syscall.o -o sum

04_sum.o: 04_sum/sum.s
	nasm -f elf32 04_sum/sum.s -o 04_sum.o

multiples: 05_multiples.o num2str.o syscall.o
	ld -m elf_i386 05_multiples.o num2str.o syscall.o -o multiples

05_multiples.o: 05_multiples/multiples.s
	nasm -f elf32 05_multiples/multiples.s -o 05_multiples.o
