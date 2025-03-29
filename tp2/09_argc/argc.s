section .text
global _start

extern exit
extern num2str
extern write_stdout
extern argc

_start:
    mov ebp, esp
    call argc

    push eax
    mov ecx, ost
    push ecx
    call num2str

    mov edx, len
    call write_stdout

    call exit

section .data
ost db  "    ", 10
len equ $-ost
