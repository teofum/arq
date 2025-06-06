section .text

global write_stdout

; write_stdout
;
; Print text to stdout using the write system call
; ECX: beginning of string
; EDX: character count
;
; Example call
; mov ecx, string
; mov edx, len
; call write_stdout

write_stdout:
    push ebp
    mov ebp, esp
    pushad

    mov eax, 04h    ; write
    mov ebx, 1      ; stdout file descriptor
    int 80h

    popad
    mov esp, ebp
    pop ebp
    ret
    
global read_stdin

; read_stdin
;
; Read text from stdin using the read system call
; ECX: buffer to read data to
; EDX: max character count to read
;
; Example call
; mov ecx, string
; mov edx, max_len
; call read_stdin

read_stdin:
    push ebp
    mov ebp, esp
    pushad

    mov eax, 03h    ; read
    mov ebx, 1      ; stdin file descriptor
    int 80h

    popad
    mov esp, ebp
    pop ebp
    ret


global exit

; exit
;
; End the program execution with the exit system call
;
; Example call:
; call exit

exit:
    mov eax, 01h    ; exit
    mov ebx, 0      ; exit with code 0, success
    int 80h

global getpid

; getpid
;
; Get the current PID
; EAX: (out) PID
;
; Example call
; call getpid

getpid:
    mov eax, 14h
    int 80h

    ret

global fork

; fork
;
; Fork the process. Returns the process PID
; EAX: (out) PID
;
; Example call
; call fork

fork:
    push ebx
    mov eax, 02h
    mov ebx, 0
    int 80h

    pop ebx
    ret

