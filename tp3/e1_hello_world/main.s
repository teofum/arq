section .text
global main

extern hello_world

main:
    call hello_world

    mov eax, 0      ; exit with code 0, success
    ret             ; we're in a c env, so we can exit by returning from main

section .data
