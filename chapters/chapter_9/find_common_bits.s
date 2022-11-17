# Write a program using bit flags that takes three
# different values and finds the bits they all have in common.
# Return the number that has all those bits in common.

.globl   _start
.section .rodata

value_one:
	.quad 0x321

value_two:
	.quad 0xfeca1

value_three:
	.quad 0xbeef1

	.section .text

_start:
	movq value_one, %rax
	andq value_two, %rax
	andq value_three, %rax # at this point %rax has all common bits set
	movq %rax, %rdi

exit:
	movq $60, %rax # save exit code and quit
	syscall

