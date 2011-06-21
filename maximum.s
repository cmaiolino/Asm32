#POURPOSE:	This program finds the maximum number of
#		a set of data items
#
#VARIABLES:	The registers have the following uses:
#
# %edi - Holds the index of the data item being examined
# %ebx - Largest data item found
# %eax - Current data item
#
#The following memory locaions are used:
#
# data_items -  contains the item data.	A 0 is used
#		to terminate the data
#

.section .data

data_items:		#These are the data items
	.long 3, 67, 34, 93, 45, 75, 54, 34, 144, 33, 22, 5, 66, 2
end_items:

.section .text

.globl _start

_start:
	movl $0, %edi			# Move 0 into the index register
	movl data_items(,%edi,4), %eax	# Load the first byte of data
	movl %eax, %ebx			# Since this is the first item, %eax
					# is the biggest

start_loop:				# Start the loop
	cmpl $12, %edi			# Check to see if we have hit the end
	je loop_exit
	incl %edi			# Load the next value
	movl data_items(,%edi,4), %eax
	cmpl %eax, %ebx			# Compare values
	jle start_loop			# Jump to loop beginning if the new
					# one is not bigger
	movl %eax, %ebx			# Move the value as the largest
	jmp start_loop			#Jump to loop beginning

# The compare commands will make use of the
# status register (%EFLAGS), where these will
# store the results of each comparison

# Jump statements always compare the second argument 
# against the first one. on the example above, 
# jge start_loop compares if %ebx is greater than or 
# equal to %eax 

loop_exit:
	# %ebx is the status code for the exit system call
	# and it already has the maximum number

	movl $1, %eax	#Load exit() syscall on %eax
			# 1 is the exit() syscall
	int $0x80


