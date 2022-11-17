# count 1 bits set in register

.globl _start

.section .rodata

input:
	.quad 0b001110101110 # 7 zeroes

register_size:
	.quad 64

	.section .text

_start:
	movq input, %rax
	movq register_size, %rcx
	movq $0, %rdi # set starting count

loop_start:
	testb $0b00000001, %al
	jz    loop_wrap

	incq %rdi

loop_wrap:
	rorq  $1, %rax # rotate register
	loopq loop_start

exit:
	movq $60, %rax # save exit code and quit
	syscall

