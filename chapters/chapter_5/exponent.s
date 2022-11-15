# Calculates 2^3
# Variables:
#
# - base is stored in %r8
# - exponent is stored in %r9
# - accumulated value stored in %rax
#

.section .rodata
.globl   _start
.section .text

# another comment
_start:
	movq $2, %r8 # setup base
	movq $3, %r9 # setup exponent
	movq $1, %rax # setup acc

exponent_loop:
	addq $0, %r9 # add zero to exponent to set the `ZF` flag
	jz   exponent_loop_end # exit loop if exponent is down to 0

	mulq %r8 # else, multiply base by exponent and decrease exponent by one
	decq %r9

	jmp exponent_loop

# move return value to %rdi to return it
exponent_loop_end:
	movq %rax, %rdi
	movq $60, %rax
	syscall
