A:
	.long	10

B:
	.long	10

	.section	.rodata
.LC0:
	.string	"COUNTING"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	DWORD PTR [rbp-4], edi
	mov	QWORD PTR [rbp-16], rsi
	jmp	.L2
.L3:
	mov	edi, OFFSET FLAT:.LC0
	call	puts
	mov	eax, DWORD PTR A[rip]
	add	eax, 1
	mov	DWORD PTR A[rip], eax
.L2:
	mov	edx, DWORD PTR A[rip]
	mov	eax, DWORD PTR B[rip]
	cmp	edx, eax
	jl	.L3
	leave
	ret
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
