	.text
	.file	"/b/build/slave/linux/build/src/buildbot/work/gcc/gcc/testsuite/gcc.c-torture/execute/981206-1.c"
	.globl	foo
	.type	foo,@function
foo:                                    # @foo
	.local  	i32
# BB#0:                                 # %entry
	i32.const	$0=, 0
	i32.const	$push0=, 1
	i32.store8	$push1=, x($0), $pop0
	i32.store8	$discard=, y($0), $pop1
	return
func_end0:
	.size	foo, func_end0-foo

	.globl	main
	.type	main,@function
main:                                   # @main
	.result 	i32
	.local  	i32
# BB#0:                                 # %if.end
	i32.const	$0=, 0
	i32.const	$push0=, 1
	i32.store8	$push1=, x($0), $pop0
	i32.store8	$discard=, y($0), $pop1
	call    	exit, $0
	unreachable
func_end1:
	.size	main, func_end1-main

	.type	x,@object               # @x
	.lcomm	x,1
	.type	y,@object               # @y
	.lcomm	y,1

	.ident	"clang version 3.8.0 "
	.section	".note.GNU-stack","",@progbits