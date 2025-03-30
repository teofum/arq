section .text

global argc

; argc
; 
; Get the number of arguments the program was called with
; EAX: (out) arg count
;
; Example call
; call argc

argc:
    mov eax, [ebp]
    ret

global argv

; argv
;
; Get a pointer to a program argument
; EAX: (in) arg number, (out) pointer to arg value
; Behavior is undefined if number is greater than argc
;
; Example call
; mov eax, 2
; call argv

argv:
    mov eax, [ebp + 4 * eax + 4]
    ret

global env

; env
;
; Get the nth environment variable
; EAX: (in) env var number, (out) pointer to env var value
; Behavior is undefined if number is greater than env var
; count. If equal, the returned pointer is zero.
;
; Example call
; mov eax, 2
; call env

env:
    push ebx

    mov ebx, eax
    call argc
    add eax, ebx
    mov eax, [ebp + 4 * eax + 8]

    pop ebx
    ret

global find_env
extern strcmp
extern strcpy

; find_env
;
; Get an environment variable by name
; EAX: (in) pointer to variable name null-terminated string,
;      (out) pointer to variable value, or 0 if not found
;
; Example call
; mov eax, varname
; call find_env

find_env:
    push ebx
    push ecx
    push edx

    ; Initialize
    mov ebx, 0
    mov ecx, 0
    mov cl, 3dh     ; '=', equals sign
    mov edx, find_env_varname

find_env_loop:
    push eax
    mov eax, ebx
    call env
    cmp eax, 0
    je  find_env_not_found

    call strcpy     ; EDX <- variable name
    mov [find_env_var_addr], eax
    pop eax         ; EAX <- search name
    push eax
    push ebx
    mov ebx, edx    ; EBX <- variable name
    call strcmp     ; Compare names
    pop ebx

    cmp al, 0
    je  find_env_found
    
    pop eax
    inc ebx
    jmp find_env_loop

find_env_found:
    pop eax
    mov eax, [find_env_var_addr]
    inc eax         ; Skip the '=' character
    jmp find_env_end

find_env_not_found:
    pop eax
    mov eax, 0

find_env_end:
    pop edx
    pop ecx
    pop ebx
    ret

section .data
find_env_var_addr   dd  0
find_env_varname    db  256 dup (0)
