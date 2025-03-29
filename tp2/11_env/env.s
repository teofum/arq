section .text
global _start

extern exit
extern println
extern argv
extern find_env

_start:
    mov ebp, esp

    mov eax, 0
    call argv       ; EAX <- first arg value
    call find_env   ; EAX <- pointer to env var with that name

    cmp eax, 0
    jne found

    mov eax, str_not_found

found:
    call println

    call exit

section .data
str_not_found   db "Environment variable not found", 0
