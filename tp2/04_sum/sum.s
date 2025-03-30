section .text

global _start

extern exit
extern sum
extern num2str
extern println

_start:
    mov eax, [num]
    call sum

    push eax
    mov eax, string
    push eax
    call num2str
    call println

    call exit

section .data
num     dd 1000
string  db 64 dup (0)
