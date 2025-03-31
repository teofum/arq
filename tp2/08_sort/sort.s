section .text
global _start

extern exit
extern num2str
extern sort
extern qsort
extern print
extern println

_start:
    ; Sort array
    mov eax, arr
    mov ebx, [len]
    call qsort

    mov ecx, eax
    jmp loop

loop_pre:
    mov eax, comma
    call print

loop:
    ; Print to string and write to stdout
    mov eax, [ecx]
    push eax
    mov eax, string
    push eax
    call num2str
    call print

    add ecx, 4
    dec ebx
    jnz loop_pre

    ; Print a newline
    mov eax, comma
    add eax, 2      ; Empty string
    call println

    call exit

section .data
arr     dd  9, 5, 10, 3, 1, 4, 2, 7, 6, 8
len     dd  10
string  db  64 dup (0)
comma   db  ", ", 0
