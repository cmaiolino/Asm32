#POURPOSE:	Simple program that exits and returns
#		a status code back to the Linux kernel

#INPUT:		none

#OUTPUT:	returns a status code. This can be viewd
#		by typing
#
#		echo $?
#

#VARIABLES:
#		%eax holds the system call number
#		%ebx holds the return status
#

# Everything start with a computer is not 
# directly translated into a machine 
# instruction
# These are assembler directives or pseudo-operations.
#Which are handled by the assembler but no run by computer

# .section command, break the program into sections

# .data section is where you list any memory storage you'll need for data.
.section .data

# .text - where program instructions live
.section .text

# defines a symbl named _start
# .globl tells the assembler to not discard the symbol 
# after assemble it, because the linker will need it.
# _start is the special symbol that will be always marked
# with .globl, because it marks the location of the start
# of the program.

.globl _start

# defines the value of the _start label.

# A label is a symbol followed by a colon (:), 
# which specifies the symbol's value

# When the assembler is assembling the program,
# it has to assign each data value and instruction
# an addres.

# Labels tell the assembler to make the symbol's 
# value be wherever the next instruction or data 
# element will be

_start:

# Here starts the actual computer instructions:

# When the program runs, this instruction
# (movl) transfers the number 1 into 
# %eax register

# The $ sign tells the assembler to use 
# Immediate Mode addressing
# Without the $ sign, it would do 
# Direct Addressing

# To make syscalls, the syscall 
# number must be loaded in %eax

movl $1, %eax	#This is the linux kernel command
		#number (syscall) for exiting
		#a program

# exit() syscall (syscall 1 loaded in %eax), need
# to have the exit value loaded in %ebx

movl $3, %ebx	#This is the status number we will
		#return to te operating system.
		#Change this around and it will
		#return different things to
		#echo $?

#The MAGIC instruction.

# int stands to interrupt and
# 0x80 is the interrupt number
# to use.

int $0x80	# this wakes up the kernel to run
		# the exit command
