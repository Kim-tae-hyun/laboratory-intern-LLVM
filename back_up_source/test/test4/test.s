	.text
	.file	"test.bc"
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Lcfi0:
	.cfi_def_cfa_offset 16
.Lcfi1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi2:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$0, -20(%rbp)
	movl	$10, -8(%rbp)
	movl	$20, -4(%rbp)
	leaq	-4(%rbp), %rax
	movq	%rax, -16(%rbp)
	leaq	-8(%rbp), %rsi
	movq	%rsi, number(%rip)
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	movq	number(%rip), %rax
	movl	(%rax), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movq	-16(%rbp), %rsi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movq	-16(%rbp), %rax
	movl	(%rax), %esi
	movl	$.L.str.3, %edi
	xorl	%eax, %eax
	callq	printf
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc

	.type	number,@object          # @number
	.comm	number,8,8
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	" number = %p\n"
	.size	.L.str, 14

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	" *number = %d\n"
	.size	.L.str.1, 15

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	" pointer = %p\n"
	.size	.L.str.2, 15

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	" *pointer = %d\n"
	.size	.L.str.3, 16


	.ident	"clang version 5.0.0 (trunk 292471)"
	.section	".note.GNU-stack","",@progbits
