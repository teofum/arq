section .text
global _start

extern exit
extern println
extern to_upper

_start:
    mov eax, string ; ptr to text
    call to_upper
    call println

    call exit

section .data
string  db  "h4ppy c0d1ng", 10, 0
