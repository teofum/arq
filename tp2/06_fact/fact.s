section .text
global _start

extern write_stdout
extern exit
extern num2str

_start:
    ; Initialize regs
    mov eax, [n]
    mov ebx, eax
    
    ; Calculate factorial
loop:
    dec ebx
    mul ebx         ; Ignore the higher word (EDX), result -> EAX
    cmp ebx, 1
    jg  loop

    ; Print result to string and write to stdout
    push eax
    mov ecx, ost
    push ecx
    call num2str

    mov ecx, pre
    mov edx, len
    call write_stdout

    call exit

section .data
n   dd  8
pre db  "8! = "
ost db  "          ", 10
len equ $-pre
