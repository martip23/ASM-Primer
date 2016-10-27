	.file	"test_if.c"
	.intel_syntax noprefix
	.globl	A
	.data
	.align 4
	.type	A, @object
	.size	A, 4
A:
	.long	10
	.globl	B
	.align 4
	.type	B, @object
	.size	B, 4
B:
	.long	10
	.section	.rodata
.LC0:
	.string	"TRUE"
.LC1:
	.string	"FALSE"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	DWORD PTR [rbp-4], edi
	mov	QWORD PTR [rbp-16], rsi
	mov	edx, DWORD PTR A[rip]
	mov	eax, DWORD PTR B[rip]
	cmp	edx, eax
	jle	.L2
	mov	edi, OFFSET FLAT:.LC0
	call	puts
	jmp	.L4
.L2:
	mov	edi, OFFSET FLAT:.LC1
	call	puts
.L4:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
