	.text
	.file	"test.bc"
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Lcfi0:
	.cfi_def_cfa_offset 16
	movl	$.L__unnamed_1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$.Lstr, %edi
	callq	puts
	movl	$.L__unnamed_2, %edi
	xorl	%eax, %eax
	callq	printf
	xorl	%eax, %eax
	popq	%rcx
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc

	.globl	addnum
	.p2align	4, 0x90
	.type	addnum,@function
addnum:                                 # @addnum
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Lcfi1:
	.cfi_def_cfa_offset 16
.Lcfi2:
	.cfi_offset %rbx, -16
	movl	$.L__unnamed_3, %edi
	xorl	%eax, %eax
	callq	printf
	movl	number(%rip), %ebx
	movl	$.L__unnamed_4, %edi
	xorl	%eax, %eax
	callq	printf
	incl	%ebx
	movl	$.L__unnamed_5, %edi
	xorl	%eax, %eax
	callq	printf
	movl	%ebx, number(%rip)
	movl	$.L__unnamed_6, %edi
	xorl	%eax, %eax
	callq	printf
	popq	%rbx
	retq
.Lfunc_end1:
	.size	addnum, .Lfunc_end1-addnum
	.cfi_endproc

	.type	number,@object          # @number
	.data
	.globl	number
	.p2align	2
number:
	.long	9                       # 0x9
	.size	number, 4

	.type	.Lstr,@object           # @str
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstr:
	.asciz	"hello world!"
	.size	.Lstr, 13

	.type	.L__unnamed_1,@object   # @0
.L__unnamed_1:
	.asciz	"insert>\n"
	.size	.L__unnamed_1, 9

	.type	.L__unnamed_2,@object   # @1
.L__unnamed_2:
	.asciz	"insert>\n"
	.size	.L__unnamed_2, 9

	.type	.L__unnamed_3,@object   # @2
.L__unnamed_3:
	.asciz	"insert>\n"
	.size	.L__unnamed_3, 9

	.type	.L__unnamed_4,@object   # @3
.L__unnamed_4:
	.asciz	"insert>\n"
	.size	.L__unnamed_4, 9

	.type	.L__unnamed_5,@object   # @4
.L__unnamed_5:
	.asciz	"insert>\n"
	.size	.L__unnamed_5, 9

	.type	.L__unnamed_6,@object   # @5
.L__unnamed_6:
	.asciz	"insert>\n"
	.size	.L__unnamed_6, 9


	.ident	"clang version 5.0.0 (trunk 292471)"
	.section	".note.GNU-stack","",@progbits
