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

global kbd_getkey
kbd_getkey:
.loop:
	in 	al, 0x64
	and al, 0x1
	jz	.loop
	in 	al, 0x60
	ret

global 