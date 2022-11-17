# find a number in an array of numbers
# and return the index

.globl   _start
.section .rodata

target:
	.quad 200

numbers:
	.quad 20, 200, 233, 108, 52, 10, 1

numbers_end:

	.section .text

_start:
	leaq numbers, %rdi
	movq target, %rax
	movq $(numbers_end - numbers) / 8, %rcx

start_search:
	repne scasq

end_search:
	movq $(numbers_end - numbers) / 8, %rdi
	subq %rcx, %rdi

exit:
	movq $60, %rax # save exit code and quit
	syscall

