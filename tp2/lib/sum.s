section .text

global sum
; sum
; 
; Takes a number n and calculates the sum of the first n
; natural numbers [1; n]
; EAX: n (input), result (output)
;
; Example call:
; mov eax 10
; call sum      ; eax = 55


sum:
    push ebx    ; Keep B register value

    mov ebx, eax
    mov eax, 0

sum_loop:
    add eax, ebx
    dec ebx
    jnz sum_loop

    pop ebx     ; Restore B register
    ret
