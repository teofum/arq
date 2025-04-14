section .text

global sys_exit
; void sys_exit(int code)
; exit the program

sys_exit:
    push ebp
    mov ebp, esp

    mov eax, 0x1
    mov ebx, [ebp + 8]
    int 0x80

global sys_write
; ssize_t sys_write(unsigned int fd, void* buf, unsigned int len)

sys_write:
    push ebp
    mov ebp, esp
    push ebx

    mov eax, 0x4
    mov ebx, [ebp + 8]      ; fd
    mov ecx, [ebp + 12]     ; buf
    mov edx, [ebp + 16]     ; len
    int 0x80

    pop ebx
    mov esp, ebp
    pop ebp
    ret

global sys_read
; ssize_t sys_read(unsigned int fd, void* buf, unsigned int len)

sys_read:
    push ebp
    mov ebp, esp
    push ebx

    mov eax, 0x3
    mov ebx, [ebp + 8]      ; fd
    mov ecx, [ebp + 12]     ; buf
    mov edx, [ebp + 16]     ; len
    int 0x80

    pop ebx
    mov esp, ebp
    pop ebp
    ret

global sys_open
; int sys_open(const char* filename, int flags, int mode)

sys_open:
    push ebp
    mov ebp, esp
    push ebx

    mov eax, 0x5
    mov ebx, [ebp + 8]      ; filename
    mov ecx, [ebp + 12]     ; flags
    mov edx, [ebp + 16]     ; mode
    int 0x80

    pop ebx
    mov esp, ebp
    pop ebp
    ret

global sys_close
; int sys_close(int fd)

sys_close:
    push ebp
    mov ebp, esp
    push ebx

    mov eax, 0x6
    mov ebx, [ebp + 8]      ; fd
    int 0x80

    pop ebx
    mov esp, ebp
    pop ebp
    ret
