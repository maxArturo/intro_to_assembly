# PURPOSE:  Simple program that exits and returns a
# status code back to the Linux kernel
#
# INPUT:    none
#
# OUTPUT:   returns a status code.  This can be viewed
# by typing #
# echo $?
# after running the program
#

.section .rodata
.globl   _start
.section .text

_start:
	movq    $60, %rax # system call number for os exit
	movq    $3, %rdi  # %rdi holds the exit code of the program
	syscall # this wakes up the kernel to run the system call stored in %rax

# Change this around and it will
# return different things to
# echo $?
