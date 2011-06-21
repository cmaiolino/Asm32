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

start_data:		#These are the data items
	.long 9, 67, 34, 93, 45, 75, 54, 34, 144, 33, 22, 5, 66, 2
end_data:

.section .text

.globl _start

_start:

	movl start_data, %eax
	movl (%eax), %ebx	
#	pushl end_data
#	pushl start_data
#	call find_maximum
#	addl $8, %esp

#	movl %eax, %ebx
	movl $1, %eax
	int $0x80


#FIND_MAXIMUM
#
# receive start_address and end_address of the numbers list
# returns the maximum on %eax
#
# Uses %eax to store the maximum value found
# %edi to store the current number of the list

#.type find_maximum, @function
#find_maximum:
#	push %ebp
#	movl %esp, %ebp
#	subl $8, %esp

#	movl 8(%ebp), %eax
#	movl 12(%ebp), %ebx
	
	#movl %eax, %ebx
	#movl %ebx, -8(%ebp)

#	incl %eax
#	movl (%eax), %ebx
#	movl %ebx, %edi
#	movl (%eax), %eax
#	movl %ebx, %eax
#	jmp end_loop
#start_loop:
#	
#	cmpl %edi, -8(%ebp)
#	je end_loop
#	incl %edi
#	cmpl %eax,(%edi)
#	jle start_loop
#
#	movl (%edi), %eax
#	jmp start_loop 

#end_loop:
#	movl %ebp, %esp
#	popl %ebp
#	ret
