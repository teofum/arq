section .text

extern seven

seven:
    push ebp
    mov ebp, esp

    mov eax, 7

    leave
    ret
