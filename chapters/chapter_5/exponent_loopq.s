# Calculates 2^3 using loopq instruction
# Variables:
#
# - base is stored in %rbx
# - exponent is stored in %rcx
# - accumulated value stored in %rax
#

.section .rodata
.globl   _start
.section .text

# another comment
_start:
	movq $2, %rbx # setup base
	movq $3, %rcx # setup exponent (also counter)
	movq $1, %rax # setup acc

	cmpq $0, %rcx # compare with 0
	je   exponent_loop_end # exit loop if exponent is down to 0

exponent_loop:

	mulq  %rbx # else, multiply base by exponent
	loopq exponent_loop

# move return value to %rdi to return it
exponent_loop_end:
	movq %rax, %rdi
	movq $60, %rax
	syscall
