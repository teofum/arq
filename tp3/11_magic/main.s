;ejemplo.s

extern printf
global main

main:
    push ebp                                ; build stack frame
    mov ebp, esp                            ;
    and esp, -16                            ; align stack pointer
    sub esp, 32                             ; reserve 32 bytes (8 dwords)
    mov DWORD [esp+19], 1819043176      ; 6c 6c 65 68   "hell"
    mov DWORD [esp+23], 1870078063      ; 6f 77 20 6f   "o wo"
    mov DWORD [esp+27], 174353522       ; 0a 64 6c 72   "rld\n"
    mov BYTE [esp+31], 0                ; 00            "\0"
    lea eax, [esp+19]                       ; call magia with esp + 19 as argument
    mov DWORD [esp], eax                ; 
    call magia                              ; 
    lea eax, [esp+19]                       ; printf with esp + 19 as format string
    mov DWORD [esp], eax                ;
    call printf                             ;
    mov eax, 0
    leave                                   ; does this fall through? missing return
    ret

magia:
    push ebp                        ; build stack frame
    mov ebp, esp                    ;
    sub esp, 16                     ; reserve 16 bytes (4 dwords)
    jmp .L4
.L6:
    mov eax, DWORD [ebp+8]      ; jump if AL <= 96 ('a' - 1)
    movzx eax, BYTE [eax]       ;
    cmp al, 96                      ;
    jle .L5
    mov eax, DWORD [ebp+8]      ; jump if AL > 122 ('z')
    movzx eax, BYTE [eax]       ;
    cmp al, 122                     ;
    jg .L5                          ; falls through if 'a' <= AL <= 'z', ie AL is a lowercase letter
    mov eax, DWORD [ebp+8]      ; EAX <- param
    movzx eax, BYTE [eax]       ; EAX <- [EAX]
    mov BYTE [ebp-1], al        ; store in local var
    movzx eax, BYTE [ebp-1]     ; back to eax (pointless)
    sub eax, 32                     ; sub 32, lower to uppercase
    mov BYTE [ebp-1], al        ; store in memory again
    mov eax, DWORD [ebp+8]      ; EAX <- param
    movzx edx, BYTE [ebp-1]     ; EDX <- uppercase letter
    mov BYTE [eax], dl          ; [EAX] <- uppercase letter
.L5:
    add DWORD [ebp+8], 1        ; increment param
.L4:
    mov eax, DWORD [ebp+8]      ; EAX <- first param
    movzx eax, BYTE [eax]       ; EAX <- [EAX]
    test al, al                     ; jump if AL != 0
    jne .L6                         ;
    leave
    ret
