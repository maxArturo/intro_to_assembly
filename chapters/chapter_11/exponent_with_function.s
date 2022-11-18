# write a function that takes a base and exponent, and
# raises the base to the exponent.

# %rdi has the base
# %rsi has the exponent
# Uses a single quadword variable

.globl exponent
.type  exponent, @function

.section .rodata

.section .text

exponent:
	pushq %rbp # Enter: set up stack frame
	movq  %rsp, %rbp # set the new base pointer of this function to be the current stack pointer
	subq  $16, %rsp # allocate space with stack pointer for 16 bytes to keep it aligned

	movq $1, %rax # accumulate answer in rax
	movq %rsi, -8(%rbp)  # move exponent to stack frame

main_exponent_loop:
	mulq %rdi
	decq -8(%rbp) # count down for number of multiplications. this could really have been a loopq on %rcx
	jnz  main_exponent_loop

exit_exponent:
	movq %rbp, %rsp # leave
	popq %rbp

	ret # answer is already in %rax

