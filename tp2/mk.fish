#!/opt/homebrew/bin/fish

set -l num $argv[1]
set -l name $argv[2]
set -l dir_name (string join _ $num $name)

set -l libs $argv[3..]

mkdir $dir_name

echo "section .text
global _start

extern exit

_start:

    call exit

section .data" >> $dir_name/$name.s

echo "
$name: $dir_name.o syscall.o $libs
	ld -g -m elf_i386 $dir_name.o syscall.o $libs -o $name

$dir_name.o: $dir_name/$name.s
	nasm -g -F dwarf -f elf32 $dir_name/$name.s -o $dir_name.o" >> Makefile
