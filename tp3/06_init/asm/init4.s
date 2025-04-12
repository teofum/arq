	.file	"init4.c"
	.intel_syntax noprefix
	.text
	.globl	init
	.type	init, @function
init:
	push	ebp
	mov	ebp, esp
	sub	esp, 104
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	eax, DWORD PTR gs:20
	mov	DWORD PTR -12[ebp], eax
	xor	eax, eax
	pxor	xmm0, xmm0
	movups	XMMWORD PTR -92[ebp], xmm0
	movups	XMMWORD PTR -76[ebp], xmm0
	movups	XMMWORD PTR -60[ebp], xmm0
	movups	XMMWORD PTR -44[ebp], xmm0
	movups	XMMWORD PTR -28[ebp], xmm0
	mov	DWORD PTR -52[ebp], 5
	nop
	mov	eax, DWORD PTR -12[ebp]
	sub	eax, DWORD PTR gs:20
	je	.L2
	call	__stack_chk_fail_local
.L2:
	leave
	ret
	.size	init, .-init
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
	mov	eax, DWORD PTR [esp]
	ret
	.hidden	__stack_chk_fail_local
	.ident	"GCC: (GNU) 14.2.1 20250207"
	.section	.note.GNU-stack,"",@progbits
