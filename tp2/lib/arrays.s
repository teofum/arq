section .text

global min

; min
;
; Returns the minimum element of an array of 4-byte signed integers
; EAX: pointer to array start (in), minimum value (out)
; EBX: length of array
;
; Example call
; mov eax array
; mov ebx len
; call min
min:
    push ecx
    push ebx

    mov ecx, eax
    mov eax, [ecx]
    
min_loop:
    add ecx, 4
    cmp eax, [ecx]
    jle min_next

    mov eax, [ecx]
    
min_next:
    dec ebx
    jnz min_loop

    pop ebx
    pop ecx
    ret
