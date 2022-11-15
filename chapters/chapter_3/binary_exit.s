# PURPOSE:  identical to `exit.s`
# but uses binary numbers
#

.section .rodata
.globl   _start
.section .text

_start:
	movq    $0b1101, %rax # system call number for os exit
	movq    $3, %rdi  # %rdi holds the exit code of the program
	syscall # this wakes up the kernel to run the system call stored in %rax

# Change this around and it will
# return different things to
# echo $?
