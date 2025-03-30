section .text
global _start

extern exit
extern read_stdin
extern println
extern to_upper

_start:
    mov ecx, buf
    mov edx, size
    call read_stdin

    mov eax, buf
    call to_upper
    call println

    call exit

section .data
buf     db  1024 dup (0)
size    equ $-buf
