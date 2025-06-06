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

global strcmp

; strcmp
;
; Compares two strings lexicographically. Returns zero if the 
; strings are equal, negative value if lhs is first, positive
; value if rhs is first.
; EAX: (in) pointer to lhs
; EBX: (in) pointer to rhs
; AL: (out) return value
;
; Example call
; mov eax, str1
; mov ebx, str2
; call strcmp
; cmp al, 0

strcmp:
    push ecx
    push edx

    mov ecx, 0
    mov edx, 0

strcmp_cmp_char:
    mov cl, [eax]
    mov dl, [ebx]

    sub cl, dl          ; Compare characters
    jnz strcmp_end      ; Chars are different, return

    cmp dl, 0           ; Look for a null terminator
    je  strcmp_end      ; Chars are equal and both are 0, strings are equal

    inc eax
    inc ebx
    jmp strcmp_cmp_char

strcmp_end:
    mov eax, ecx

    pop edx
    pop ecx
    ret

global strcpy

; strcpy
;
; Copy a string to a destination address, until a limiter character
; is found. The limiter char is replaced with a null terminator.
; EAX: (in) begin of source string, (out) end of string or limit char
; EDX: begin of destination string
; CL: limiter char

strcpy:
    push ecx
    push edx

strcpy_loop:
    mov ch, [eax]
    cmp ch, cl
    je  strcpy_end  ; Found the limiter char, end here
    cmp ch, 0
    je  strcpy_end  ; Found a null terminator, end here

    mov [edx], ch
    inc eax
    inc edx
    jmp strcpy_loop

strcpy_end:
    mov ch, 0
    mov [edx], ch

    pop edx
    pop ecx
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

global is_lower

; is_lower
; 
; Returns 1 if a character is a lowercase letter, 0 if not.
; AL: (in) character
; EAX: (out) return value
;
; Example call
; mov al '5'
; call is_lower

is_lower:
    cmp al, 'a'
    jl  is_lower_no
    cmp al, 'z'
    jg  is_lower_no

    mov eax, 1
    ret

is_lower_no:
    mov eax, 0
    ret

global to_upper

; to_upper
;
; Convert a null-terminated string to uppercase. Uppercase
; letters and non-letter characters are kept as is.
; EAX: pointer to beginning of string
;
; Example call
; mov eax string
; call to_upper

to_upper:
    pushad
    mov ebx, eax
    mov ecx, 0

to_upper_loop:
    mov al, [ebx]
    cmp al, 0
    je  to_upper_end

    mov cl, al
    call is_lower
    cmp eax, 0
    je  to_upper_next

    sub cl, 'a' - 'A' 
    mov [ebx], cl

to_upper_next:
    inc ebx
    jmp to_upper_loop

to_upper_end:
    popad
    ret

section .data
nl  db  10

