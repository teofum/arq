section .text

global strlen

; strlen
;
; Returns the length in characters of a null-terminated string,
; NOT including the null terminator.
; EAX: (in) start of string, (out) length of string
; 
; Example call
; mov eax, string
; call strlen

strlen:
    push ebx
    push ecx

    mov ebx, eax    ; Backup start position

strlen_loop:
    mov cl, [eax]
    cmp cl, 0
    je  strlen_end  ; Found a null terminator, end here

    inc eax
    jmp strlen_loop

strlen_end:
    sub eax, ebx

    pop ecx
    pop ebx
    ret

global print
extern write_stdout

; print
;
; Prints a null-terminated string to stdout.
; EAX: (in) start of string
;
; Example call
; mov eax, string
; call print

print:
    pushad

    mov ecx, eax
    call strlen
    mov edx, eax
    call write_stdout

    popad
    ret

global println

; println
;
; Prints a null-terminated string to stdout, followed by a newline.
; EAX: (in) start of string
;
; Example call
; mov eax, string
; call print

println:
    call print
    
    pushad
    mov ecx, nl
    mov edx, 1
    call write_stdout
    popad

    ret

section .data
nl  db  10
