section .text
global _start

extern exit
extern println

_start:
    mov eax, 162
    mov ebx, time
    mov ecx, 0
    int 80h
    
    mov eax, string
    call println

    call exit

section .rodata
time    dd  5, 0    ; Seconds, nanoseconds
string  db  "*yawn* hello.... world...."
