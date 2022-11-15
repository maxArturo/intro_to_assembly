# Sets return status code to 1 if target number is even, 0 if odd
# Variables:
#
# - target numer in %rax
# - divisor in %rbx
# - remaineder in %rdx
#

.section .rodata
.globl   _start
.section .text

# another comment
_start:
	movq $32, %rax # setup target number to evaluate
	movq $2, %rbx # setup divisor
	movq $0, %rdx # prepare remainder register

	divq %rbx # remainder is stored now in %rdx

	cmpq $0, %rdx # compare with 0
	je   on_even
	jmp  on_odd

on_even:
	movq $1, %rdi
	jmp  program_end

on_odd:
	movq $0, %rdi
	jmp  program_end # redundant but probably good practice

# move return value to %rdi to return it
program_end:
	movq $60, %rax
	syscall
