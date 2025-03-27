#!/opt/homebrew/bin/fish

set -l num $argv[1]
set -l name $argv[2]
set -l dir_name (string join _ $num $name)

set -l libs $argv[3..]

mkdir $dir_name

echo "section .text
GLOBAL _start

_start:
    ; Syscall: exit
    mov eax, 01h    ; exit
    mov ebx, 1      ; exit with code 0, success
    int 80h

section .data" >> $dir_name/$name.s

echo "
$name: $dir_name.o $libs
	ld -m elf_i386 $dir_name.o $libs -o $name

$dir_name.o: $dir_name/$name.s
	nasm -f elf32 $dir_name/$name.s -o $dir_name.o" >> Makefile
