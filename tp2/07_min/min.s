section .text
global _start

extern write_stdout
extern exit
extern num2str
extern min

_start:
    ; Get minimum of array
    mov eax, arr
    mov ebx, [len]
    call min

    ; Print to string and write to stdout
    push eax
    mov ecx, ost
    push ecx
    call num2str

    mov edx, oln
    call write_stdout

    call exit

section .data
arr dd  9, 5, 10, 3, 1, 4, 2, 7, 6, 8
len dd 10
ost db "     ", 10
oln equ $-ost
