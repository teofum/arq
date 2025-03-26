section .text
GLOBAL _start

_start:
        ; Syscall: write
        mov eax, 04h    ; write
        mov ebx, 1      ; stdout file descriptor
        mov ecx, hello  ; ptr to text
        mov edx, len    ; char count
        int 80h

        ; Syscall: exit
        mov eax, 01h    ; exit
        mov ebx, 1      ; exit with code 0, success
        int 80h

section .data
hello   db  "Hello World", 10
len     equ $-hello
