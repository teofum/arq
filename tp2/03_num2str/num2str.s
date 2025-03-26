section .text
GLOBAL _start

; num2str
; Takes a number and memory address, and writes the number
; as a string at the given address
; EAX: number
; EBX: output address
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

_start:
        mov eax, [num]
        push eax
        mov eax, string
        push eax
        call num2str

        ; Syscall: write
        mov eax, 04h    ; write
        mov ebx, 1      ; stdout file descriptor
        mov ecx, string ; ptr to text
        mov edx, 2      ; char count
        int 80h

        ; Syscall: exit
        mov eax, 01h    ; exit
        mov ebx, 1      ; exit with code 0, success
        int 80h

section .data
num     dd 76
string  db "       "
