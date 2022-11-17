# get length of a string

.globl _start

.section .rodata

input_str:
	.ascii "lets see how big this is!\0"

	.section .text

_start:
	movq $-1, %rcx # make sure we have a lot of steps for counter
	leaq input_str, %rdi # move address to register
	movb $0, %al # set search byte (null terminator)

	repne scasb # scasb finishes by incrementing address

result:
	subq $input_str, %rdi
	decq %rdi

exit:
	movq $60, %rax # save exit code and quit
	syscall

