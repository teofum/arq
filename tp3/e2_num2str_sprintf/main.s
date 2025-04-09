section .text
global main

extern puts, sprintf

main:
    push dword [number]
    push fmt
    push buffer
    call sprintf
    add esp, 3 * 4  ; reset stack

    push buffer
    call puts
    add esp, 4      ; reset stack

    mov eax, 0      ; exit with code 0, success
    ret

section .rodata
fmt     db  "The number is %d", 0
number  dd  69420

section .bss
buffer  resb 40
