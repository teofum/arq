section .text
global _start

extern exit
extern println
extern env

_start:
    mov ebp, esp

    mov ebx, 0

loop:
    mov eax, ebx
    call env

    cmp eax, 0
    je  end

    call println
    inc ebx
    jmp loop

end:
    call exit

section .data
