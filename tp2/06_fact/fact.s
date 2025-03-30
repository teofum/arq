section .text
global _start

extern exit
extern num2str
extern println

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
    mov eax, ost
    push eax
    call num2str

    mov eax, pre
    call println

    call exit

section .data
n   dd  8
pre db  "8! = "
ost db  64 dup (0)
