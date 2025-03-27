section .text

global min

; min
;
; Returns the minimum element of an array of 4-byte signed integers
; EAX: pointer to array start (in), pointer to minimum value (out)
; EBX: length of array
;
; Example call
; mov eax array
; mov ebx len
; call min
min:
    push edx
    push ecx
    push ebx

    mov ecx, eax
    
min_loop:
    add ecx, 4
    mov edx, [eax]
    cmp edx, [ecx]
    jle min_next

    mov eax, ecx
    
min_next:
    dec ebx
    jnz min_loop

    pop ebx
    pop ecx
    pop edx
    ret

global sort

; sort
;
; Sorts an array of 4-byte signed integers in place
; EAX: pointer to array start
; EBX: length of array
;
; Example call
; mov eax array
; mov ebx len
; call sort
sort:
    pushad

sort_loop:
    ; Find minimum element of array
    push eax
    call min
    mov ecx, eax    ; ECX <- ptr to minimum
    pop eax

    ; Swap first element with min
    push ebx
    mov edx, [ecx]  ; EDX <- min
    mov ebx, [eax]  ; EBX <- first
    mov [ecx], ebx
    mov [eax], edx
    pop ebx

    ; Move to next element, sort the rest of the array
    add eax, 4
    dec ebx
    jnz sort_loop

    popad
    ret

