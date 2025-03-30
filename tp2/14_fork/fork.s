section .text
global _start

extern exit
extern fork
extern println

_start:
    ; Fork
    call fork

    ; Check PID
    cmp eax, 0
    je  child

parent:
    mov eax, parent_str
    call println
    jmp end

child:
    mov eax, child_str
    call println

end:
    call exit

section .rodata
parent_str  db  "I am the parent", 0
child_str   db  "I am the child", 0
