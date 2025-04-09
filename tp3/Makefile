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
