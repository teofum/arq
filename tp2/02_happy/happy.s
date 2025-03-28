section .text
global _start

extern write_stdout
extern exit

is_lowerc:
    cmp al, 61h         ; 61h = 'a'
    jl  is_lowerc_no    ; char < 'a' -> not a letter
    
    cmp al, 7ah         ; 7ah = 'z'
    jg  is_lowerc_no    ; char > 'z' -> not a letter

is_lowerc_yes:
    mov ebx, 1
    ret
        
is_lowerc_no:
    mov ebx, 0
    ret

to_upper:
    mov al, [ecx]   ; Char to EAX

    call is_lowerc  ; EBX = 1 if letter       
    cmp ebx, 1
    jne to_upper_next

    sub al, 20h     ; Convert to uppercase letter
    mov [ecx], al   ; Overwrite string memory

to_upper_next:
    inc ecx
    dec edx
    jnz to_upper
        
    ret

_start:
    mov ecx, string ; ptr to text
    mov edx, len    ; char count
    call to_upper

    mov ecx, string ; ptr to text
    mov edx, len    ; char count
    call write_stdout

    call exit

section .data
string  db  "h4ppy c0d1ng", 10
len     equ $-string
