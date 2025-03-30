# Function library targets

num2str.o: lib/num2str.s
	nasm -g -F dwarf -f elf32 lib/num2str.s -o num2str.o

sum.o: lib/sum.s
	nasm -g -F dwarf -f elf32 lib/sum.s -o sum.o

syscall.o: lib/syscall.s
	nasm -g -F dwarf -f elf32 lib/syscall.s -o syscall.o

arrays.o: lib/arrays.s
	nasm -g -F dwarf -f elf32 lib/arrays.s -o arrays.o

args.o: lib/args.s
	nasm -g -F dwarf -f elf32 lib/args.s -o args.o

string.o: lib/string.s
	nasm -g -F dwarf -f elf32 lib/string.s -o string.o

# Binary targets

hello: 01_hello.o syscall.o
	ld -g -m elf_i386 01_hello.o syscall.o -o hello

01_hello.o: 01_hello/hello.s
	nasm -g -F dwarf -f elf32 01_hello/hello.s -o 01_hello.o

happy: 02_happy.o syscall.o
	ld -g -m elf_i386 02_happy.o syscall.o -o happy

02_happy.o: 02_happy/happy.s
	nasm -g -F dwarf -f elf32 02_happy/happy.s -o 02_happy.o

num2str: 03_num2str.o num2str.o syscall.o string.o
	ld -g -m elf_i386 03_num2str.o num2str.o syscall.o string.o -o num2str

03_num2str.o: 03_num2str/num2str.s
	nasm -g -F dwarf -f elf32 03_num2str/num2str.s -o 03_num2str.o

sum: 04_sum.o sum.o num2str.o syscall.o string.o
	ld -g -m elf_i386 04_sum.o sum.o num2str.o syscall.o string.o -o sum

04_sum.o: 04_sum/sum.s
	nasm -g -F dwarf -f elf32 04_sum/sum.s -o 04_sum.o

multiples: 05_multiples.o num2str.o syscall.o string.o
	ld -g -m elf_i386 05_multiples.o num2str.o syscall.o string.o -o multiples

05_multiples.o: 05_multiples/multiples.s
	nasm -g -F dwarf -f elf32 05_multiples/multiples.s -o 05_multiples.o

fact: 06_fact.o num2str.o syscall.o string.o
	ld -g -m elf_i386 06_fact.o num2str.o syscall.o string.o -o fact

06_fact.o: 06_fact/fact.s
	nasm -g -F dwarf -f elf32 06_fact/fact.s -o 06_fact.o

min: 07_min.o syscall.o num2str.o arrays.o string.o
	ld -g -m elf_i386 07_min.o syscall.o num2str.o arrays.o string.o -o min

07_min.o: 07_min/min.s
	nasm -g -F dwarf -f elf32 07_min/min.s -o 07_min.o

sort: 08_sort.o syscall.o num2str.o arrays.o string.o
	ld -g -m elf_i386 08_sort.o syscall.o num2str.o arrays.o string.o -o sort

08_sort.o: 08_sort/sort.s
	nasm -g -F dwarf -f elf32 08_sort/sort.s -o 08_sort.o

argc: 09_argc.o syscall.o num2str.o args.o string.o
	ld -g -m elf_i386 09_argc.o syscall.o num2str.o args.o string.o -o argc

09_argc.o: 09_argc/argc.s
	nasm -g -F dwarf -f elf32 09_argc/argc.s -o 09_argc.o

argv: 10_argv.o syscall.o num2str.o args.o string.o
	ld -g -m elf_i386 10_argv.o syscall.o num2str.o args.o string.o -o argv

10_argv.o: 10_argv/argv.s
	nasm -g -F dwarf -f elf32 10_argv/argv.s -o 10_argv.o

env: 11_env.o syscall.o num2str.o args.o string.o
	ld -g -m elf_i386 11_env.o syscall.o num2str.o args.o string.o -o env

11_env.o: 11_env/env.s
	nasm -g -F dwarf -f elf32 11_env/env.s -o 11_env.o

stack: 12_stack.o syscall.o num2str.o string.o
	ld -g -m elf_i386 12_stack.o syscall.o num2str.o string.o -o stack

12_stack.o: 12_stack/stack.s
	nasm -g -F dwarf -f elf32 12_stack/stack.s -o 12_stack.o

pid: 13_pid.o syscall.o num2str.o string.o
	ld -g -m elf_i386 13_pid.o syscall.o num2str.o string.o -o pid

13_pid.o: 13_pid/pid.s
	nasm -g -F dwarf -f elf32 13_pid/pid.s -o 13_pid.o

fork: 14_fork.o syscall.o num2str.o string.o
	ld -g -m elf_i386 14_fork.o syscall.o num2str.o string.o -o fork

14_fork.o: 14_fork/fork.s
	nasm -g -F dwarf -f elf32 14_fork/fork.s -o 14_fork.o
