section .text
	
global cpuVendor
cpuVendor:
	push rbp
	mov rbp, rsp

	push rbx

	mov rax, 0
	cpuid


	mov [rdi], ebx
	mov [rdi + 4], edx
	mov [rdi + 8], ecx

	mov byte [rdi+13], 0

	mov rax, rdi

	pop rbx

	mov rsp, rbp
	pop rbp
	ret

global rtc_getval
rtc_getval:
	mov rax, rdi
	out 0x70, al
	
	mov rax, 0
	in al, 0x71
	ret

global kbd_irq_handler
extern kbd_addKeyEvent
kbd_irq_handler:
    mov rax, 0
    in al, 0x60
    mov rdi, rax
    call kbd_addKeyEvent
    ret

global _cli
_cli:
    cli
    ret

global _sti
_sti:
    sti
    ret

%macro pushall 0

    push rax
    push rcx
    push rdx
    push rsi
    push rdi
    push r8
    push r9
    push r10
    push r11

%endmacro

%macro popall 0

    pop r11
    pop r10
    pop r9
    pop r8
    pop rdi
    pop rsi
    pop rdx
    pop rcx
    pop rax

%endmacro

extern irq_dispatch
%macro irq_handler 1

    pushall
    push rbp
    mov rbp, rsp

    mov rdi, %1
    call irq_dispatch

    ; Signal EOI
    mov al, 0x20
    out 0x20, al

    mov rsp, rbp
    pop rbp
    popall
    iretq

%endmacro

global _irq_00_handler
_irq_00_handler:
    irq_handler 0

global _irq_01_handler
_irq_01_handler:
    irq_handler 1

global pic_master_mask
pic_master_mask:
    mov rax, rdi
    out 0x21, al
    ret

global pic_slave_mask
pic_slave_mask:
    mov rax, rdi
    out 0xa1, al
    ret
