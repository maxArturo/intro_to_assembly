# gets byte 5 from a number in a register

.globl _start

.section .rodata

mystery_number:
	.quad 0xed7

	.section .text

_start:
	movq mystery_number, %rax
	movq $0, %rdi
	rorq $4, %rax

	testb $0b00000001, %al
	jz    exit
	incq  %rdi

exit:
	movq $60, %rax # save exit code and quit
	syscall

