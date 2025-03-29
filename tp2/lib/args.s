section .text

global argc

; argc
; 
; Get the number of arguments the program was called with
; EAX: (out) arg count
;
; Example call
; call argc

argc:
    mov eax, [ebp]
    ret

global argv

; argv
;
; Get a pointer to a program argument
; EAX: (in) arg number, (out) pointer to arg value
; Behavior is undefined if number is greater than argc
;
; Example call
; mov eax, 2
; call argv

argv:
    mov eax, [ebp + 4 * eax + 4]
    ret
