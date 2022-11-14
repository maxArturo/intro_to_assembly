# PURPOSE: Find the largest number 
#          
# INPUT:    Numbers to search
#
# OUTPUT:   returns a status code.  This can be viewed
# by typing #
# echo $?
#          after running the program
#
# VARIABLES:
#          %eax holds the current element
#          %ebx holds the current highest value
#          %edi holds current position in the list
#
# N.B. for now we're following the book's sugggestion to use a 0
# to indicate that we've reached the end of the list. I'd like 
# to use something more concrete later.
#

.section .data

data_items:
  .long 3,67,34,222,45,75,54,34,44,240,22,11,66,0

.section .text

.globl _start

_start:
  # initialize the registers for the loop
  movl $0, %edi # initialize the index register with 0
  movl data_items(,%edi,4), %eax # initialize the current element register
  movl %eax, %ebx # initialize the largest num register

start_loop:
  # exit loop if current element is 0 
  cmpl $0, %eax 
  je end_loop

  incl %edi
  movl data_items(,%edi,4), %eax # load the next element into the 
                                 # curr element register

  cmpl %ebx, %eax
  jle start_loop # jump if curr element is <= curr highest 
  movl %eax, %ebx # set new largest number
  jmp start_loop

end_loop:
  # we're using the status code to report back on highest number
  # this limits us to max 255 range of numbers
  # %ebx is the syscall status code; it already has the max number
  movl $1, %eax # 1 is the exit() syscall
  int $0x80
