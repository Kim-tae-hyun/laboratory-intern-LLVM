	.text
	.file	"test.bc"
	.globl	aa
	.p2align	4, 0x90
	.type	aa,@function
aa:                                     # @aa
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
	subq	$16, %rsp
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$.L__unnamed_1, %edi
	xorl	%eax, %eax
	callq	printf
	movq	$number, -8(%rbp)
	movl	$.L__unnamed_2, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movq	-8(%rbp), %rax
	incl	(%rax)
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end0:
	.size	aa, .Lfunc_end0-aa
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Lcfi3:
	.cfi_def_cfa_offset 16
.Lcfi4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi5:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$0, -12(%rbp)
	movl	$.L.str.2, %edi
	movl	$number, %esi
	movl	$number, %edx
	xorl	%eax, %eax
	callq	printf
	movl	$.L__unnamed_3, %edi
	xorl	%eax, %eax
	callq	printf
	movq	$number, -8(%rbp)
	movl	$.L__unnamed_4, %edi
	xorl	%eax, %eax
	callq	printf
	movq	-8(%rbp), %rsi
	movl	$.L.str.3, %edi
	xorl	%eax, %eax
	movq	%rsi, %rdx
	callq	printf
	movl	$.L.str.4, %edi
	xorl	%eax, %eax
	callq	printf
	movq	-8(%rbp), %rax
	movl	$2, (%rax)
	movl	$.L.str.5, %edi
	xorl	%eax, %eax
	callq	printf
	callq	aa
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc

	.type	number,@object          # @number
	.data
	.globl	number
	.p2align	2
number:
	.long	1                       # 0x1
	.size	number, 4

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"load 2nd\n"
	.size	.L.str, 10

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"store 2nd\n"
	.size	.L.str.1, 11

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"%d %p\n"
	.size	.L.str.2, 7

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"* %d %p\n"
	.size	.L.str.3, 9

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	"store 1st\n"
	.size	.L.str.4, 11

	.type	.L.str.5,@object        # @.str.5
.L.str.5:
	.asciz	"func call\n"
	.size	.L.str.5, 11

	.type	.L__unnamed_1,@object   # @0
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_1:
	.asciz	"104576400 104701904 140733919350880 44996809 104554064 104547120 \n"
	.size	.L__unnamed_1, 67

	.type	.L__unnamed_2,@object   # @1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_2:
	.asciz	"insert>a\n"
	.size	.L__unnamed_2, 10

	.type	.L__unnamed_3,@object   # @2
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_3:
	.asciz	"104576400 104701904 140733919350880 44996809 104554064 104547120 \n"
	.size	.L__unnamed_3, 67

	.type	.L__unnamed_4,@object   # @3
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_4:
	.asciz	"insert>a\n"
	.size	.L__unnamed_4, 10


	.ident	"clang version 5.0.0 (trunk 292471)"
	.section	".note.GNU-stack","",@progbits
