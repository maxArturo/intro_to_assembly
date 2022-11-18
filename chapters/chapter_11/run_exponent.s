# executes the `exponent` function.

# %rdi has the base
# %rsi has the exponent
# Uses a single quadword variable

.globl   _start
.section .rodata
.section .text

_start:
	movq $4, %rdi # base
	movq $4, %rsi # exponent

	call exponent

	mov  %rax, %rdi # return with answer as status code
	movq $60, %rax
	syscall
