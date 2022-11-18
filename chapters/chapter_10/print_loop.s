# Write a program that prints out the same string ten times in a loop.

.globl _start

.section .rodata

input_string:
	.ascii "this gets printed a lot\n"

strings_end:

	.section .text

_start:
	movq $10, %rcx # setup loop total count
	movq $input_string, %rsi # pointer to data start
	movq $0x01, %rdi # file descriptor for stdout
	movq $(strings_end - input_string), %rdx # data length

loop_print:
	movq  %rcx, %rbx # save loop count in case syscall clobbers it
	movq  $0x01, %rax # write syscall
	syscall
	movq  %rbx, %rcx # save loop count in case syscall clobbers it
	loopq loop_print

exit:
	movq $60, %rax # save exit code and quit
	syscall
