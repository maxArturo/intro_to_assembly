# exercise in arithmetic functions
.globl   _start
.section .text

_start:
	movq $3, %rdi
	movq %rdi, %rax
	addq %rdi, %rax # rax -> 6
	mulq %rdi # rax -> 18
	movq $2, %rdi
	addq %rdi, %rax # rax -> 20
	movq $4, %rdi
	mulq %rdi # rax -> 80
	movq %rax, %rdi

# syscall number
movq $60, %rax
syscall
