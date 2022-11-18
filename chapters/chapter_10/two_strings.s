# Write a program that prints out two different strings one right after the other.
.globl _start

.section .rodata

first_string:
	.ascii "Hey yall pardners\n"

second_string:
	.ascii "What he doin\n"

strings_end:

	.section .text

_start:
	movq $0x01, %rdi # file descriptor for stdout
	movq $first_string, %rsi # pointer to data start
	movq $(second_string - first_string), %rdx # data length
	movq $0x01, %rax # write syscall
	syscall

	movq $0x01, %rdi # file descriptor for stdout
	movq $second_string, %rsi # pointer to data start
	movq $(strings_end - second_string), %rdx # data length
	movq $0x01, %rax # write syscall
	syscall

exit:
	movq $60, %rax # save exit code and quit
	syscall

