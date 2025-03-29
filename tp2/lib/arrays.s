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

global qsort

; qsort (currently broken, TODO: debug this)
;
; Sorts an array of 4-byte signed integers in place
; Uses the quicksort algorithm
; EAX: pointer to array start
; EBX: length of array
;
; Example call
; mov eax array
; mov ebx len
; call qsort
qsort:
    pushad

    ; If length = 1 stop
    cmp ebx, 1
    jle qsort_end

    push ebx        ; push len

    ; Initialize
    ; Use first element as pivot
    mov ebx, eax    ; EBX <- pivot address
    mov ecx, [eax]  ; ECX <- pivot
    mov edx, eax    ; EDX <- right
    add edx, ebx    ; EAX + 4 * EBX - 4
    add edx, ebx
    add edx, ebx
    add edx, ebx
    sub edx, 4
    add eax, 4      ; EAX <- left

qsort_loop:
    ; If left >= right stop
    cmp eax, edx
    jge qsort_divide

qsort_loop_left:
    ; Increase EAX (left) until greater than or equal to pivot
    cmp ecx, [eax]
    jle qsort_loop_right

    add eax, 4
    jmp qsort_loop_left

qsort_loop_right:
    ; Decrease EDX (right) until less than pivot
    cmp ecx, [edx]
    jg  qsort_swap

    sub edx, 4
    jmp qsort_loop_right

qsort_swap:
    pushad
    mov ebx, [eax]
    mov ecx, [edx]
    mov [edx], ebx
    mov [eax], ecx
    popad

    jmp qsort_loop

qsort_divide:
    ; Swap left with pivot
    push ecx
    mov ecx, [eax]
    mov [ebx], ecx
    pop ecx
    mov [eax], ecx
    
    ; Sort left half: start = start, len = left - start
    sub eax, ebx        ; len - start * 4
    mov edx, 0
    push ebx
    mov ebx, 4
    div ebx             ; EAX <- len - start
    pop ebx
    mov ecx, eax
    mov eax, ebx        ; EAX <- start
    mov ebx, eax        ; EBX <- len - start
    call qsort

    ; Sort right half: start = left, len = len - left + 1
    mov ecx, eax        ; ECX <- left
    pop eax             ; pop len
    sub eax, ecx
    mov edx, 0
    push ebx
    mov ebx, 4
    div ebx
    pop ebx
    add eax, 4
    mov ebx, eax
    mov eax, ecx
    call qsort

qsort_end:

    popad
    ret

