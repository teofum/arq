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

puts: 03_puts/main.o 03_puts/puts.o 03_puts/write.o
	gcc -g -fno-builtin -m32 03_puts/main.o 03_puts/puts.o 03_puts/write.o -o puts

03_puts/main.o: 03_puts/main.c
	gcc -c -g -F dwarf -m32 03_puts/main.c -o 03_puts/main.o

03_puts/puts.o: 03_puts/puts.c
	gcc -c -g -F dwarf -m32 03_puts/puts.c -o 03_puts/puts.o

03_puts/write.o: 03_puts/write.s
	nasm -g -F dwarf -f elf32 03_puts/write.s -o 03_puts/write.o

seven: 04_seven/main.o 04_seven/seven.o 
	gcc -g -m32 04_seven/main.o 04_seven/seven.o  -o seven

04_seven/main.o: 04_seven/main.c
	gcc -c -g -F dwarf -m32 04_seven/main.c -o 04_seven/main.o

04_seven/seven.o: 04_seven/seven.s
	nasm -g -F dwarf -f elf32 04_seven/seven.s -o 04_seven/seven.o

vars: 05_vars/vars1.c 05_vars/vars2.c 05_vars/vars3.c 05_vars/vars4.c 05_vars/vars5.c 05_vars/vars6.c
	gcc -c 05_vars/vars1.c -m32 -fno-dwarf2-cfi-asm -fno-exceptions -S -fno-asynchronous-unwind-tables -masm=intel 
	gcc -c 05_vars/vars2.c -m32 -fno-dwarf2-cfi-asm -fno-exceptions -S -fno-asynchronous-unwind-tables -masm=intel 
	gcc -c 05_vars/vars3.c -m32 -fno-dwarf2-cfi-asm -fno-exceptions -S -fno-asynchronous-unwind-tables -masm=intel 
	gcc -c 05_vars/vars4.c -m32 -fno-dwarf2-cfi-asm -fno-exceptions -S -fno-asynchronous-unwind-tables -masm=intel 
	gcc -c 05_vars/vars5.c -m32 -fno-dwarf2-cfi-asm -fno-exceptions -S -fno-asynchronous-unwind-tables -masm=intel 
	gcc -c 05_vars/vars6.c -m32 -fno-dwarf2-cfi-asm -fno-exceptions -S -fno-asynchronous-unwind-tables -masm=intel 

init: 06_init/init1.c 06_init/init2.c 06_init/init3.c 06_init/init4.c 06_init/init5.c 06_init/init6.c
	gcc -c 06_init/init1.c -m32 -fno-dwarf2-cfi-asm -fno-exceptions -S -fno-asynchronous-unwind-tables -masm=intel 
	gcc -c 06_init/init2.c -m32 -fno-dwarf2-cfi-asm -fno-exceptions -S -fno-asynchronous-unwind-tables -masm=intel 
	gcc -c 06_init/init3.c -m32 -fno-dwarf2-cfi-asm -fno-exceptions -S -fno-asynchronous-unwind-tables -masm=intel 
	gcc -c 06_init/init4.c -m32 -fno-dwarf2-cfi-asm -fno-exceptions -S -fno-asynchronous-unwind-tables -masm=intel 
	gcc -c 06_init/init5.c -m32 -fno-dwarf2-cfi-asm -fno-exceptions -S -fno-asynchronous-unwind-tables -masm=intel 
	gcc -c 06_init/init6.c -m32 -fno-dwarf2-cfi-asm -fno-exceptions -S -fno-asynchronous-unwind-tables -masm=intel 

loader: 07_loader/main.o 07_loader/loader.o
	gcc -g -m32 -nostartfiles 07_loader/main.o 07_loader/loader.o -o loader

07_loader/loader.o: 07_loader/loader.s
	nasm -g -F dwarf -f elf32 07_loader/loader.s -o 07_loader/loader.o

07_loader/main.o: 07_loader/main.c
	gcc -c -g -F dwarf -m32 07_loader/main.c -o 07_loader/main.o

my_stdlib: 08_my_stdlib/main.o 08_my_stdlib/my_stdlib.o 
	gcc -g -m32 -fno-builtin 08_my_stdlib/main.o 08_my_stdlib/my_stdlib.o  -o my_stdlib

08_my_stdlib/main.o: 08_my_stdlib/main.c
	gcc -c -g -F dwarf -m32 08_my_stdlib/main.c -o 08_my_stdlib/main.o

08_my_stdlib/my_stdlib.o: 08_my_stdlib/my_stdlib.s
	nasm -g -F dwarf -f elf32 08_my_stdlib/my_stdlib.s -o 08_my_stdlib/my_stdlib.o

cpuid: 09_cpuid/main.o 09_cpuid/cpuid.o 
	gcc -g -m32 09_cpuid/main.o 09_cpuid/cpuid.o  -o cpuid

09_cpuid/main.o: 09_cpuid/main.c
	gcc -c -g -F dwarf -m32 09_cpuid/main.c -o 09_cpuid/main.o

09_cpuid/cpuid.o: 09_cpuid/cpuid.s
	nasm -g -F dwarf -f elf32 09_cpuid/cpuid.s -o 09_cpuid/cpuid.o

fib: 10_fib/main.o 10_fib/fib.o
	gcc -g -m32 10_fib/main.o 10_fib/fib.o  -o fib
	gcc -c 10_fib/main.c -m32 -fno-dwarf2-cfi-asm -fno-exceptions -S -fno-asynchronous-unwind-tables -masm=intel -o fib_compiled.s

10_fib/main.o: 10_fib/main.c
	gcc -c -g -F dwarf -m32 10_fib/main.c -o 10_fib/main.o

10_fib/fib.o: 10_fib/fib.s
	nasm -g -F dwarf -f elf32 10_fib/fib.s -o 10_fib/fib.o

magic: 11_magic/main.o 
	gcc -g -m32 11_magic/main.o  -o magic

11_magic/main.o: 11_magic/main.s
	nasm -g -F dwarf -f elf32 11_magic/main.s -o 11_magic/main.o

structs: 12_structs/main.o 12_structs/structs.o 
	gcc -g -m32 12_structs/main.o 12_structs/structs.o  -o structs

12_structs/main.o: 12_structs/main.c
	gcc -c -g -F dwarf -m32 12_structs/main.c -o 12_structs/main.o

12_structs/structs.o: 12_structs/structs.s
	nasm -g -F dwarf -f elf32 12_structs/structs.s -o 12_structs/structs.o

args64: 64_args64/main.o 64_args64/args64.o 
	gcc -g -m64 64_args64/main.o 64_args64/args64.o  -o args64

64_args64/main.o: 64_args64/main.c
	gcc -c -g -F dwarf -m64 64_args64/main.c -o 64_args64/main.o

64_args64/args64.o: 64_args64/args64.s
	nasm -g -F dwarf -f elf64 64_args64/args64.s -o 64_args64/args64.o
