section .text
global _start

extern exit
extern num2str
extern min
extern println

_start:
    ; Get minimum of array
    mov eax, arr
    mov ebx, [len]
    call min

    ; Print to string and write to stdout
    mov eax, [eax]
    push eax
    mov eax, ost
    push eax
    call num2str
    call println

    call exit

section .data
arr dd  9, 5, 10, 3, 1, 4, 2, 7, 6, 8
len dd  10
ost db  64 dup (0)
