# adds two signed numbers
# if overflows, return 1
# otherwise return 0

.globl _start

.section .rodata

first_value:
	.byte 0x7f

second_value:
	.byte 0x7f

	.section .text

_start:
	movb first_value, %al
	movb second_value, %dl
	addb %dl, %al
	jno  overflow_not_set
	jo   overflow_set

overflow_not_set:
	movq $0, %rdi
	jmp  exit

overflow_set:
	movq $1, %rdi

exit:
	movq $60, %rax # save exit code and quit
	syscall

