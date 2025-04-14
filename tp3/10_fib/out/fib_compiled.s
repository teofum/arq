	.file	"main.c"
	.intel_syntax noprefix
	.text

; START OF FIB FUNCTION ====================================================
	.globl	fib_c
	.type	fib_c, @function
fib_c:
	push	ebp
	mov	ebp, esp
	push	ebx
	sub	esp, 4
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	cmp	DWORD PTR 8[ebp], 1
	jg	.L2
	mov	eax, DWORD PTR 8[ebp]
	jmp	.L3
.L2:
	mov	eax, DWORD PTR 8[ebp]
	sub	eax, 1
	sub	esp, 12
	push	eax
	call	fib_c
	add	esp, 16
	mov	ebx, eax
	mov	eax, DWORD PTR 8[ebp]
	sub	eax, 2
	sub	esp, 12
	push	eax
	call	fib_c
	add	esp, 16
	add	eax, ebx
.L3:
	mov	ebx, DWORD PTR -4[ebp]
	leave
	ret
	.size	fib_c, .-fib_c
; = END OF FIB FUNCTION ====================================================

	.section	.rodata
.LC0:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
	lea	ecx, 4[esp]
	and	esp, -16
	push	DWORD PTR -4[ecx]
	push	ebp
	mov	ebp, esp
	push	ebx
	push	ecx
	sub	esp, 16
	call	__x86.get_pc_thunk.bx
	add	ebx, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	eax, ecx
	mov	eax, DWORD PTR 4[eax]
	add	eax, 4
	mov	eax, DWORD PTR [eax]
	sub	esp, 12
	push	eax
	call	atoi@PLT
	add	esp, 16
	mov	DWORD PTR -12[ebp], eax
	sub	esp, 12
	push	DWORD PTR -12[ebp]
	call	fib_c
	add	esp, 16
	sub	esp, 8
	push	eax
	lea	eax, .LC0@GOTOFF[ebx]
	push	eax
	call	printf@PLT
	add	esp, 16
	sub	esp, 12
	push	DWORD PTR -12[ebp]
	call	fib_asm@PLT
	add	esp, 16
	sub	esp, 8
	push	eax
	lea	eax, .LC0@GOTOFF[ebx]
	push	eax
	call	printf@PLT
	add	esp, 16
	mov	eax, 0
	lea	esp, -8[ebp]
	pop	ecx
	pop	ebx
	pop	ebp
	lea	esp, -4[ecx]
	ret
	.size	main, .-main
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
	mov	eax, DWORD PTR [esp]
	ret
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
	mov	ebx, DWORD PTR [esp]
	ret
	.ident	"GCC: (GNU) 14.2.1 20250207"
	.section	.note.GNU-stack,"",@progbits
