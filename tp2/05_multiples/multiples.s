section .text
global _start

extern exit
extern num2str
extern println

_start:
    ; Initialize
    mov eax, ost    ; Need the mem address in a register so we can push it
    mov ebx, [k]
    mov ecx, [n]
    mov edx, ecx

loop:
    ; Print number to stdout
    push ecx
    push eax
    call num2str
    call println

    ; Increase by n and loop while n <= k
    add ecx, edx
    cmp ecx, ebx
    jle loop

    call exit

section .data
n   dd  3
k   dd  121
ost db  64 dup (0)
