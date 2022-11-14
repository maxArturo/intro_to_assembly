# PURPOSE: illustrate power functions and simple
# C-style ABI for assembly function calls.

# Everything is stored in registers
# so the data section is empty.

.section .rodata

.section .text

.globl _start

_start:
	pushl $3      # second arg
	pushl $2      # first arg
	call  power    # func call

	addl  $8, %esp # move sp back 2 words
	pushl %eax    # save function result before calling

# next func

