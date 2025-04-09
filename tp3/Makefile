hello_world: e1_hello_world/main.o e1_hello_world/hello_world.o 
	gcc -g -m32 e1_hello_world/main.o e1_hello_world/hello_world.o  -o hello_world

e1_hello_world/main.o: e1_hello_world/main.s
	nasm -g -F dwarf -f elf32 e1_hello_world/main.s -o e1_hello_world/main.o

e1_hello_world/hello_world.o: e1_hello_world/hello_world.c
	gcc -c -g -F dwarf -m32 e1_hello_world/hello_world.c -o e1_hello_world/hello_world.o

num2str_sprintf: e2_num2str_sprintf/main.o 
	gcc -g -m32 e2_num2str_sprintf/main.o  -o num2str_sprintf

e2_num2str_sprintf/main.o: e2_num2str_sprintf/main.s
	nasm -g -F dwarf -f elf32 e2_num2str_sprintf/main.s -o e2_num2str_sprintf/main.o

args: 01_args/main.o 
	gcc -g -m32 01_args/main.o  -o args

01_args/main.o: 01_args/main.s
	nasm -g -F dwarf -f elf32 01_args/main.s -o 01_args/main.o

args2: 02_args2/main.c 
	gcc -c 02_args2/main.c -fno-dwarf2-cfi-asm -fno-exceptions -S -fno-asynchronous-unwind-tables -masm=intel -m32 -o args2.s

pid: e3_pid/main.o e3_pid/pid.o 
	gcc -g -m32 e3_pid/main.o e3_pid/pid.o  -o pid

e3_pid/main.o: e3_pid/main.c
	gcc -c -g -F dwarf -m32 e3_pid/main.c -o e3_pid/main.o

e3_pid/pid.o: e3_pid/pid.s
	nasm -g -F dwarf -f elf32 e3_pid/pid.s -o e3_pid/pid.o
