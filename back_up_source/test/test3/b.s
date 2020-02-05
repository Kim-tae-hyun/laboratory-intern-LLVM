	.text
	.file	"b.bc"
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
	pushq	%rbx
	subq	$24, %rsp
.Lcfi3:
	.cfi_offset %rbx, -24
	movl	$0, -24(%rbp)
	movl	$1, -12(%rbp)
	xorl	%ebx, %ebx
	movl	$.L__unnamed_1, %edi
	xorl	%eax, %eax
	callq	printf
	testb	%bl, %bl
	jne	.LBB0_2
# BB#1:                                 # %if.then
	incl	-12(%rbp)
	jmp	.LBB0_3
.LBB0_2:                                # %if.else
	movl	-12(%rbp), %ebx
	movl	$.L__unnamed_2, %edi
	xorl	%eax, %eax
	callq	printf
	cmpl	$0, %ebx
	incl	-12(%rbp)
	movl	$.L__unnamed_3, %edi
	xorl	%eax, %eax
	callq	printf
.LBB0_3:                                # %if.end6
	movl	$.L__unnamed_4, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$.L__unnamed_5, %edi
	xorl	%eax, %eax
	callq	printf
	.p2align	4, 0x90
.LBB0_4:                                # %do.body
                                        # =>This Inner Loop Header: Depth=1
	incl	-12(%rbp)
	cmpl	$3, -12(%rbp)
	jl	.LBB0_4
# BB#5:                                 # %do.end
	movl	$.L__unnamed_6, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$.L__unnamed_7, %edi
	xorl	%eax, %eax
	callq	printf
	cmpl	$9, -12(%rbp)
	jle	.LBB0_7
	jmp	.LBB0_11
	.p2align	4, 0x90
.LBB0_10:                               # %while.end
                                        #   in Loop: Header=BB0_7 Depth=1
	movl	$.L__unnamed_8, %edi
	xorl	%eax, %eax
	callq	printf
	incl	-12(%rbp)
	cmpl	$9, -12(%rbp)
	jg	.LBB0_11
.LBB0_7:                                # %while.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_9 Depth 2
	movl	$.L__unnamed_9, %edi
	xorl	%eax, %eax
	callq	printf
	cmpl	$2, -12(%rbp)
	jg	.LBB0_10
	.p2align	4, 0x90
.LBB0_9:                                # %while.body12
                                        #   Parent Loop BB0_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	addl	$2, -12(%rbp)
	cmpl	$2, -12(%rbp)
	jle	.LBB0_9
	jmp	.LBB0_10
.LBB0_11:                               # %while.end14
	movl	$.L__unnamed_10, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$0, -20(%rbp)
	movl	$0, -16(%rbp)
	movl	$0, -20(%rbp)
	movl	$.L__unnamed_11, %edi
	xorl	%eax, %eax
	callq	printf
	cmpl	$9, -20(%rbp)
	jle	.LBB0_13
	jmp	.LBB0_17
	.p2align	4, 0x90
.LBB0_16:                               # %for.end
                                        #   in Loop: Header=BB0_13 Depth=1
	movl	$.L__unnamed_12, %edi
	xorl	%eax, %eax
	callq	printf
	incl	-20(%rbp)
	cmpl	$9, -20(%rbp)
	jg	.LBB0_17
.LBB0_13:                               # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_15 Depth 2
	incl	-12(%rbp)
	movl	$0, -16(%rbp)
	movl	$.L__unnamed_13, %edi
	xorl	%eax, %eax
	callq	printf
	cmpl	$9, -16(%rbp)
	jg	.LBB0_16
	.p2align	4, 0x90
.LBB0_15:                               # %for.body19
                                        #   Parent Loop BB0_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	addl	$10, -12(%rbp)
	incl	-16(%rbp)
	cmpl	$9, -16(%rbp)
	jle	.LBB0_15
	jmp	.LBB0_16
.LBB0_17:                               # %for.end24
	movl	$.L__unnamed_14, %edi
	xorl	%eax, %eax
	callq	printf
	xorl	%eax, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc

	.type	.L__unnamed_1,@object   # @0
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"if.then >\n"
	.size	.L__unnamed_1, 11

	.type	.L__unnamed_2,@object   # @1
.L__unnamed_2:
	.asciz	"if.then2 >\n"
	.size	.L__unnamed_2, 12

	.type	.L__unnamed_3,@object   # @2
.L__unnamed_3:
	.asciz	"if.end >\n"
	.size	.L__unnamed_3, 10

	.type	.L__unnamed_4,@object   # @3
.L__unnamed_4:
	.asciz	"if.end6 >\n"
	.size	.L__unnamed_4, 11

	.type	.L__unnamed_5,@object   # @4
.L__unnamed_5:
	.asciz	"do.body >\n"
	.size	.L__unnamed_5, 11

	.type	.L__unnamed_6,@object   # @5
.L__unnamed_6:
	.asciz	"do.end >\n"
	.size	.L__unnamed_6, 10

	.type	.L__unnamed_7,@object   # @6
.L__unnamed_7:
	.asciz	"while.cond >\n"
	.size	.L__unnamed_7, 14

	.type	.L__unnamed_9,@object   # @7
.L__unnamed_9:
	.asciz	"while.cond10 >\n"
	.size	.L__unnamed_9, 16

	.type	.L__unnamed_8,@object   # @8
.L__unnamed_8:
	.asciz	"while.end >\n"
	.size	.L__unnamed_8, 13

	.type	.L__unnamed_10,@object  # @9
.L__unnamed_10:
	.asciz	"while.end14 >\n"
	.size	.L__unnamed_10, 15

	.type	.L__unnamed_11,@object  # @10
.L__unnamed_11:
	.asciz	"for.cond >\n"
	.size	.L__unnamed_11, 12

	.type	.L__unnamed_13,@object  # @11
.L__unnamed_13:
	.asciz	"for.cond17 >\n"
	.size	.L__unnamed_13, 14

	.type	.L__unnamed_12,@object  # @12
.L__unnamed_12:
	.asciz	"for.end >\n"
	.size	.L__unnamed_12, 11

	.type	.L__unnamed_14,@object  # @13
.L__unnamed_14:
	.asciz	"for.end24 >\n"
	.size	.L__unnamed_14, 13


	.ident	"clang version 5.0.0 (trunk 292471)"
	.section	".note.GNU-stack","",@progbits
