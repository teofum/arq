section .text

global _start
extern sum
extern num2str

_start:
    mov eax, [num]
    call sum
    push eax
    mov eax, string
    push eax
    call num2str

    ; Syscall: write
    mov eax, 04h    ; write
    mov ebx, 1      ; stdout file descriptor
    mov ecx, string ; ptr to text
    mov edx, len    ; char count
    int 80h

    ; Syscall: exit
    mov eax, 01h    ; exit
    mov ebx, 1      ; exit with code 0, success
    int 80h

section .data
num     dd 1000
string  db "       "
len     equ $-string
