section .text

global _start

extern exit
extern num2str
extern println

_start:
    mov eax, [num]
    push eax
    mov eax, string
    push eax
    call num2str
    call println

    call exit

section .data
num     dd 76
string  db "xxxxxxx"
