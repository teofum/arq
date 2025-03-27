section .text

global _start

extern write_stdout
extern exit
extern sum
extern num2str

_start:
    mov eax, [num]
    call sum

    push eax
    mov eax, string
    push eax
    call num2str

    mov ecx, string ; ptr to text
    mov edx, len    ; char count
    call write_stdout

    call exit

section .data
num     dd 1000
string  db "       "
len     equ $-string
