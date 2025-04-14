section .text

global get_foo

get_foo:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]

    leave
    ret

global get_bar

get_bar:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 12]

    leave
    ret

global get_bar_ptr

get_bar_ptr:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]
    mov eax, [eax + 4]

    leave
    ret

global return_a_struct

return_a_struct:
    push ebp
    mov ebp, esp

    mov edx, [ebp + 8]      ; address to leave return struct at
    
    mov eax, [ebp + 12]      ; foo = a + b
    add eax, [ebp + 16]     ;
    mov [edx + 0], eax      ;

    mov eax, [ebp + 12]      ; bar = a - b
    sub eax, [ebp + 16]     ;
    mov [edx + 4], eax      ;

    mov dword [edx + 8],  0x206d2769     ; "i'm "
    mov dword [edx + 12], 0x74732061     ; "a st"
    mov dword [edx + 16], 0x74637572     ; "ruct"
    mov byte [edx + 20], 0x0             ; "\0"

    mov eax, edx

    leave
    ret
