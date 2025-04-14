section .text

global get_cpuid

get_cpuid:
    push ebp
    mov ebp, esp
    push ebx

    mov eax, 0
    cpuid

    mov eax, [ebp + 8]
    mov [eax], ebx
    mov [eax + 4], edx
    mov [eax + 8], ecx

    pop ebx
    leave
    ret
