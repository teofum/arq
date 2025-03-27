section .text

global _start

extern write_stdout
extern exit
extern num2str

_start:
    mov eax, [num]
    push eax
    mov eax, string
    push eax
    call num2str

    mov ecx, string ; ptr to text
    mov edx, 2      ; char count
    call write_stdout

    call exit

section .data
num     dd 76
string  db "       "
