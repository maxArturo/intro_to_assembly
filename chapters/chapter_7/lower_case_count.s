# counts lower case ascii chars in a string

.globl   _start
.section .rodata

input_text:
	.ascii "teh Sample Characters!\0"

	.section .text

_start:
	leaq input_text, %rbx # set string start address
	movq $0, %rdi # initialize counter

main_loop:
	movb (%rbx), %al # moving a byte at a time
	cmpb $0, %al # check for null terminator byte
	je   end_loop

	cmpb $'a', %al # compare literal value
	jb   loop_wrap

	cmpb $'z', %al # compare literal value
	ja   loop_wrap
	incq %rdi # we found a lowercase!

loop_wrap:
	incq %rbx
	jmp  main_loop

end_loop:
	movq $60, %rax # save exit code and quit
	syscall

