section .text
global _start

extern write_stdout
extern exit
extern num2str

_start:
    ; Initialize
    mov eax, [n]
    mov ebx, [k]
    mov ecx, ost    ; Need the mem address in a register so we can push it
    mov edx, eax

loop:
    ; Print number to string
    push eax
    push ecx
    call num2str

    ; Print to stdout
    pushad          ; Store regs
    mov edx, len
    call write_stdout
    popad           ; Restore regs

    ; Increase by n and loop while n <= k
    add eax, edx
    cmp eax, ebx
    jle loop

    call exit

section .data
n   dd  3
k   dd  121
ost db  "     ", 10
len equ $-ost
