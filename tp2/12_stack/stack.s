section .text
global _start

extern exit
extern num2str
extern print
extern println

_start:
    mov ebp, esp
    mov eax, 0      ; Byte counter
    mov ecx, 0      ; Zero counter

loop:
    mov ebx, [ebp + eax]
    cmp ebx, 0
    jnz continue

    ; If the current byte is zero check ECX
    inc ecx
    cmp ecx, 2      ; First zero marks end of args, second end of envvars
    je  end         ; Stack ends after envvars

continue:
    add eax, 4
    jmp loop

end:
    mov edx, eax
    mov eax, str_begin
    call print
    mov eax, edx

    push eax
    mov eax, string
    push eax
    call num2str
    call print

    mov eax, str_end
    call println

    call exit

section .data
str_begin   db  "Stack is ", 0
str_end     db  " bytes long", 0
string      db  64 dup (0)
