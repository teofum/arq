	.file	"vars5.c"
	.intel_syntax noprefix
	.text
	.globl	foo
	.type	foo, @function
foo:
	push	ebp
	mov	ebp, esp
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	DWORD PTR num@GOTOFF[eax], 10
	nop
	pop	ebp
	ret
	.size	foo, .-foo
	.globl	num
	.data
	.align 4
	.type	num, @object
	.size	num, 4
num:
	.long	21
	.text
	.globl	bar
	.type	bar, @function
bar:
	push	ebp
	mov	ebp, esp
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	DWORD PTR num@GOTOFF[eax], 30
	nop
	pop	ebp
	ret
	.size	bar, .-bar
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
	mov	eax, DWORD PTR [esp]
	ret
	.ident	"GCC: (GNU) 14.2.1 20250207"
	.section	.note.GNU-stack,"",@progbits
