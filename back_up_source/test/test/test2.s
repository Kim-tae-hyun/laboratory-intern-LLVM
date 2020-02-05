	.text
	.file	"test2.bc"
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
	pushq	%r14
	pushq	%rbx
	subq	$16, %rsp
.Lcfi3:
	.cfi_offset %rbx, -32
.Lcfi4:
	.cfi_offset %r14, -24
	movl	$.L__unnamed_1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$0, -28(%rbp)
	movl	$.L__unnamed_2, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$.L__unnamed_3, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$0, -24(%rbp)
	movl	$.L__unnamed_4, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$.L__unnamed_5, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$3, -20(%rbp)
	movl	$.L__unnamed_6, %edi
	xorl	%eax, %eax
	callq	printf
	leaq	-24(%rbp), %r14
	leaq	-20(%rbp), %rbx
	movl	$.L.str, %edi
	xorl	%eax, %eax
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	printf
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	printf
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	" [%p %p ]\n"
	.size	.L.str, 11

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	" [%d %d ]\n"
	.size	.L.str.1, 11

	.type	.L__unnamed_1,@object   # @0
.L__unnamed_1:
	.asciz	"125083032\n"
	.size	.L__unnamed_1, 11

	.type	.L__unnamed_2,@object   # @1
.L__unnamed_2:
	.asciz	"125083032\n"
	.size	.L__unnamed_2, 11

	.type	.L__unnamed_3,@object   # @2
.L__unnamed_3:
	.asciz	"125083144\n"
	.size	.L__unnamed_3, 11

	.type	.L__unnamed_4,@object   # @3
.L__unnamed_4:
	.asciz	"125083144\n"
	.size	.L__unnamed_4, 11

	.type	.L__unnamed_5,@object   # @4
.L__unnamed_5:
	.asciz	"125083256\n"
	.size	.L__unnamed_5, 11

	.type	.L__unnamed_6,@object   # @5
.L__unnamed_6:
	.asciz	"125083256\n"
	.size	.L__unnamed_6, 11


	.ident	"clang version 5.0.0 (trunk 292471)"
	.section	".note.GNU-stack","",@progbits
