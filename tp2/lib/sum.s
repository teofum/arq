section .text

global sum
; sum
;

sum:
    push ebx    ; Keep B register value

    mov ebx, eax
    mov eax, 0

sum_loop:
    add eax, ebx
    dec ebx
    jnz sum_loop

    pop ebx     ; Restore B register
    ret
