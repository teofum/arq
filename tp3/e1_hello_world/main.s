section .text
global main

extern hello_world

main:
    call hello_world

    mov eax, 01h    ; exit
    mov ebx, 0      ; exit with code 0, success
    int 80h

section .data
