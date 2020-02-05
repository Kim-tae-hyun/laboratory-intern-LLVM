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
	pushq	%rbx
.Lcfi1:
	.cfi_def_cfa_offset 24
	pushq	%rax
.Lcfi2:
	.cfi_def_cfa_offset 32
.Lcfi3:
	.cfi_offset %rbx, -24
.Lcfi4:
	.cfi_offset %rbp, -16
	movl	$.L__unnamed_1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$.L__unnamed_2, %edi
	xorl	%eax, %eax
	callq	printf
	movl	number(%rip), %ebx
	leal	1(%rbx), %ebp
	movl	$.L__unnamed_3, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$.L__unnamed_4, %edi
	xorl	%eax, %eax
	callq	printf
	movl	%ebp, number(%rip)
	movl	$.L.str, %edi
	xorl	%eax, %eax
	movl	%ebx, %esi
	callq	printf
	movl	$.L__unnamed_5, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$.L__unnamed_6, %edi
	xorl	%eax, %eax
	callq	printf
	movl	number(%rip), %esi
	movl	$.L.str.1, %edi
	movl	$5, %edx
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	callq	printf
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc

	.type	number,@object          # @number
	.data
	.globl	number
	.p2align	2
number:
	.long	9                       # 0x9
	.size	number, 4

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"number : %d \n"
	.size	.L.str, 14

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"n : %d a : %d b : %d\n"
	.size	.L.str.1, 22

	.type	.L__unnamed_1,@object   # @0
.L__unnamed_1:
	.asciz	"insert>b\n"
	.size	.L__unnamed_1, 10

	.type	.L__unnamed_2,@object   # @1
.L__unnamed_2:
	.asciz	"insert>a\n"
	.size	.L__unnamed_2, 10

	.type	.L__unnamed_3,@object   # @2
.L__unnamed_3:
	.asciz	"insert>b\n"
	.size	.L__unnamed_3, 10

	.type	.L__unnamed_4,@object   # @3
.L__unnamed_4:
	.asciz	"insert>a\n"
	.size	.L__unnamed_4, 10

	.type	.L__unnamed_5,@object   # @4
.L__unnamed_5:
	.asciz	"insert>b\n"
	.size	.L__unnamed_5, 10

	.type	.L__unnamed_6,@object   # @5
.L__unnamed_6:
	.asciz	"insert>a\n"
	.size	.L__unnamed_6, 10


	.ident	"clang version 5.0.0 (trunk 292471)"
	.section	".note.GNU-stack","",@progbits
