section .text
global _start

extern exit
extern num2str
extern argc
extern argv
extern print
extern println

_start:
    mov ebp, esp
    call argc

    ; Initialize
    mov ebx, eax    ; EBX <- arg count
    mov ecx, 0      ; ECX <- arg index
    
    ; Print arg count
    push eax
    mov eax, num
    push eax
    call num2str

    mov eax, arg_str
    call print
    mov eax, num
    call println
    
loop:
    mov eax, begin
    call print
    
    ; Print arg number
    mov eax, ecx
    push eax
    mov eax, num
    push eax
    call num2str
    call print

    mov eax, close
    call print

    ; Print arg value
    mov eax, ecx
    call argv       ; EAX <- arg value ptr
    call println

    inc ecx
    cmp ecx, ebx
    jne loop

    call exit

section .data
arg_str db  "argc: ", 0
begin   db  "argv[", 0
close   db  "]: ", 0
num     db  64 dup (0)
