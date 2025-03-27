section .text
global _start

extern write_stdout
extern exit

_start:
    mov ecx, hello  ; ptr to text
    mov edx, len    ; char count
    call write_stdout

    call exit

section .data
hello   db  "Hello World", 10
len     equ $-hello
