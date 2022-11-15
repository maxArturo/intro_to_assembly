# Sets return status code to 1 if target number is even, 0 if odd
# uses loop instead of divq instruction
# Variables:
#
# - target numer in %rax
# - divisor in %rbx
# - remaineder in %rdx
#

.section .rodata
.globl   _start
.section .text

_start:
	movq $4, %rdi # setup target number to evaluate

count_loop:
	subq $2, %rdi
	cmpq $0, %rdi

	je  on_even
	jl  on_odd
	jmp count_loop

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
