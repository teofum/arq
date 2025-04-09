section .text
global main

extern printf

main:
    push ebp
    mov ebp, esp

    and esp, -16
    sub esp, 8
    mov eax, [ebp + 8]
    mov [esp], eax
    mov dword [esp + 4], 0 

    ; print arg count
    push dword [ebp + 8]
    push fmt
    call printf
    add esp, 2 * 4

    ; print args
loop:
    mov ecx, [esp + 4]
    mov eax, [ebp + 12]

    push dword [eax + ecx * 4]
    push ecx
    push fmt_v
    call printf
    add esp, 3 * 4
    
    mov eax, [esp + 4]
    inc eax
    mov [esp + 4], eax

    mov eax, [esp]
    dec eax
    mov [esp], eax
    jnz loop

    mov esp, ebp
    pop ebp

    mov eax, 0      ; exit with code 0, success
    ret

section .rodata
fmt     db  "arg count: %d", 10, 0
fmt_v   db  "argv[%d]: %s", 10, 0
