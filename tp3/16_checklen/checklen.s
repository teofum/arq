section .text

global checklen

checklen:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]
.loop:
    inc eax
    cmp byte [eax - 1], 0x0
    jnz .loop

    movzx eax, byte [eax]
    sub eax, [ebp + 12]

    leave
    ret
