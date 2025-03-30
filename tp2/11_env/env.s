section .text
global _start

extern exit
extern println
extern argv
extern find_env
extern strcmp

_start:
    mov ebp, esp

    ; Find the first arg value
    ; This should just be 1, but due to qemu weirdness the exec path is
    ; skipped when invoked with arguments, so we need to check.
    mov eax, 0
    call argv       ; EAX <- first arg value
    mov ecx, eax    ; Back up the arg value
    mov ebx, exec_path
    call strcmp

    cmp al, 0
    jne qemu        ; First arg is not exec name, we are in a qemu context

    ; If the first arg matches the exec path, we are NOT in a qemu context
    mov eax, 1
    call argv       ; Get the second argv (first argument)
    jmp not_qemu

qemu:
    mov eax, ecx    ; Restore arg value

not_qemu:
    call find_env   ; EAX <- pointer to env var with that name

    cmp eax, 0
    jne found

    mov eax, str_not_found

found:
    call println

    call exit

section .data
str_not_found   db  "Environment variable not found", 0
exec_path       db  "./env", 0
