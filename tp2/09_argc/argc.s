section .text
global _start

extern exit
extern num2str
extern println
extern argc

_start:
    mov ebp, esp
    call argc

    push eax
    mov eax, ost
    push eax
    call num2str
    call println

    call exit

section .data
ost db  64 dup (0)
