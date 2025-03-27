section .text
global _start

extern num2str

_start:
    ; Initialize
    mov eax, [n]
    mov ebx, [k]
    mov ecx, eax
    mov edx, ost    ; Need the mem address in a register so we can push it

loop:
    push eax
    push edx
    call num2str

    ; Syscall: write
    pushad          ; Store regs
    mov eax, 04h    ; write
    mov ebx, 1      ; stdout file descriptor
    mov ecx, ost    ; ptr to text
    mov edx, len    ; char count
    int 80h
    popad           ; Restore regs

    add eax, ecx
    cmp eax, ebx
    jle loop

    ; Syscall: exit
    mov eax, 01h    ; exit
    mov ebx, 1      ; exit with code 0, success
    int 80h

section .data
n   dd  3
k   dd  121
ost db  "     ", 10
len equ $-ost
