section .text
global _start

extern main

_start:
    push ebp
    mov ebp, esp

    ; C main function has two arguments, argv and argc
    ; argv: C takes an array of pointers, so we push the address to the first arg
    lea eax, [ebp + 8]
    push eax

    ; argc: we can just push the arg count
    push dword [ebp + 4]

    call main
    add esp, 2 * 4  ; we don't technically need to do this since we immediately exit afterwards

    mov esp, ebp
    pop ebp

    mov ebx, eax    ; use main return value as exit code
    mov eax, 0x1
    int 0x80
