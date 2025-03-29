section .text
global _start

extern exit
extern println
extern env

extern strcmp
extern argv
extern num2str

_start:
    mov ebp, esp
    mov ebx, 0

loop:
    mov eax, ebx
    call env
    cmp eax, 0
    je  end         ; If eax = 0 there are no more env vars, exit

    call println    ; Print var

    inc ebx
    jmp loop

end:
    call exit

section .data
ost     db  "                "
