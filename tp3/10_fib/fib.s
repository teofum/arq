section .text

global fib_asm

fib_asm:
    push ebp
    mov ebp, esp
    
    sub esp, 8

    mov eax, [ebp + 8]
    cmp eax, 1
    jle .end

    mov [ebp - 4], eax
    
    sub eax, 1
    push eax
    call fib_asm
    add esp, 4
    mov [ebp - 8], eax

    mov eax, [ebp - 4]
    sub eax, 2
    push eax
    call fib_asm
    add esp, 4

    add eax, [ebp - 8]

.end:
    leave
    ret
