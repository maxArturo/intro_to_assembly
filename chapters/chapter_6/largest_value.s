# gets the largest value of the array of numbers
# works for numbers > 0

.globl _start

.section .rodata

number_of_numbers:
	.quad 7

numbers:
	.quad 10, 20, 33, 108, 52, 10, 1

	.section .text

_start:
	movq number_of_numbers, %rcx # set loop count in counter register
	movq $0, %rdi # curr max register

	cmpq $0, %rcx # if no numbers exit immediately
	je   program_end

loop_start:
	movq numbers - 8 (, %rcx, 8), %rax # subtract 8 (1 word) because we're using 1-index number of numbers
	cmpq %rdi, %rax

	jbe  loop_control # start loop again if rax <= rdi
	movq %rax, %rdi

loop_control:
	loopq loop_start

program_end:
	movq $60, %rax # save exit code and quit
	syscall
