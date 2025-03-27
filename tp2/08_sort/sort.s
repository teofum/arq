section .text
global _start

extern write_stdout
extern exit
extern num2str
extern sort

_start:
    ; Sort array
    mov eax, arr
    mov ebx, [len]
    call sort

loop:
    ; Print to string and write to stdout
    mov ecx, [eax]
    push ecx
    mov ecx, ost
    push ecx
    call num2str

    mov edx, oln
    call write_stdout

    add eax, 4
    dec ebx
    jnz loop

    call exit

section .data
arr dd  9, 5, 10, 3, 1, 4, 2, 7, 6, 8
len dd 10
ost db "   , "
oln equ $-ost
