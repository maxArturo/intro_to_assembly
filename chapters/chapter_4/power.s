# PURPOSE: illustrate power functions and simple
# C-style ABI for assembly function calls.
#
# Everything is stored in registers
# so the data section is empty.

.section .rodata

.section .text

.globl _start

_start:
# second arg
pushl $3

# first arg
pushl $2

# func call
call power

# move sp back 2 words
addl $8, %esp

# save function result on stack before more ops
pushl %eax

# add more function args for next function call
pushl $2 # second arg
pushl $5 # first arg
call  power # func call

# move sp back 2 words
addl $8, %esp

# the first function call result is now in the top of the stack.
# let's save it in a register
# note we're right where we started in the stack pointer
popl %ebx

# add answers of both function calls (final result will be in %ebx)
addl %eax, %ebx

# place exit code for OS in eax register
movl $1, %eax

# call back to linux kernel
int $0x80

# function: power
# PURPOSE: rasie a base to an exponent
#
# PARAMETERS (in order)
# - base number
# - power number
#
# RETUNRS: result as return value
# NOTES: power must be 1 or greater
# we move a value to a register before multiplying
#
# VARIABLES:
# - %ebx holds base
# - %ecx holds power
# - -4(%ebp) holds curr result
# - %eax used for temp storage and final answer
#

.type power, @function

power:
# prepare for function exectution:
# save old base pointer
pushl %ebp

# make the current stack pointer the base pointer
movl %esp, %ebp

# reserve extra space for our variable (1 word)
subl $4, %esp

# move our variables into registers
# 4(%ebp) is return address
# 8(%ebp) is our first argument
# 12(%ebp) is our second argument
movl 8(%ebp), %ebx
movl 12(%ebp), %ecx

# actual function logic starts here
# move base out to temp var
movl %ebx, -4(%ebp)

# start our loop here

power_loop_start:
# exit if exponent is 1
cmpl $1, %ecx
jle  end_power_loop

# while %ecx > 1, multiply temp by base and subtract one from exponent
# move temp value to main register
movl -4(%ebp), %eax

# multiply by base (answer stored in %eax)
imull %ebx, %eax

# move result back into var address in stack
movl %eax, -4(%ebp)

# decrease exp by one
	decl %ecx
	jmp  power_loop_start

end_power_loop:
# move back temp value to %eax
movl -4(%ebp), %eax

# reset stack pointer to be base pointer
movl %ebp, %esp

# pop calling function's base pointer address to ebp register
# this also sets the stack pointer to the correct return address
# of the calling function
popl %ebp

# pop return address and hand back control to calling func
	ret

