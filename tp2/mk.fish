#!/opt/homebrew/bin/fish

set -l num $argv[1]
set -l name $argv[2]
set -l dir_name (string join _ $num $name)

mkdir $dir_name

echo "section .text
GLOBAL _start

_start:
        ; Syscall: exit
        mov eax, 01h    ; exit
        mov ebx, 1      ; exit with code 0, success
        int 80h

section .data" >> $dir_name/$name.s
