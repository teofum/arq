section .text

global num2str
; num2str
;
; Takes a number and memory address, and writes the number
; as a string at the given address
; Stack [1]: number
; Stack [0]: output address
; 
; Example call
; mov eax, [num]
; push eax
; mov eax, string
; push eax
; call num2str

num2str:
        push ebp
        mov ebp, esp
        pushad

        mov eax, [ebp + 8 + 1 * 4]
        mov ebx, 0
        mov ecx, 10
        
num2str_loop:
        mov edx, 0
        div ecx
        
        add edx, 30h    ; EDX + '0'
        push edx    

        inc ebx
        
        cmp eax, 0
        jne num2str_loop

        mov ecx, [ebp + 8 + 0 * 4]

num2str_print:
        pop edx
        mov [ecx], dl   ; Print char

        inc ecx
        dec ebx
        jnz num2str_print

        mov dl, 0
        mov [ecx], dl   ; Null terminator

        popad
        mov esp, ebp
        pop ebp
        ret


