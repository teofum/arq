section .text
    
global sys_write

sys_write:
    push rbp
    mov rbp, rsp
    push rbx

    mov rax, 0x1
    ; expect args in rdi, rsi, rdx
    syscall

    pop rbx
    mov rsp, rbp
    pop rbp
    ret
