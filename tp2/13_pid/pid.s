section .text
global _start

extern exit
extern getpid
extern num2str
extern print
extern println

_start:
    ; Print the prefix text
    mov eax, pid_pre
    call print

    ; Get and print the PID
    call getpid
    push eax
    mov eax, pid_str
    push eax
    call num2str
    call println

    call exit

section .data
pid_str db  64 dup (0)

section .rodata
pid_pre db  "My PID is ", 0
