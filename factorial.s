#PURPOSE - 	Given a number, this program computes the
#		factorial. For example, the factorial of
#		3 is 3*2*1, or 6. The factorial of
#		4 is 4*3*2*1, or 24, and so on.
#
# This program shows how to call a function recursively

.section .data
#This program has no global data
#Everything will be stored in the stack

.section .text

.globl _start
.globl factorial 	# This is unneeded unless we want to share
			# this function among other programs.

_start:

pushl $3		# The factorial takes one argument - the
			# number we want a factorial of. So, it
			# gets pushed

call factorial		#run the factorial function
addl $4, %esp		# Scrubs the parameter that was pushed on
			#the stack (clean the stack)

movl %eax, %ebx		# Factorial returns the answer in %eax, but
			# we need this into %ebx, once, this is the
			# parameter to the $1 - exit() - syscall

movl $1, %eax		# Load exit() syscall
int $0x80		# Call the syscall

# This is the actual function definition:
.type factorial, @function #This is not really needed unless we were using this function in other programs, but is a good practice

factorial:
	
	pushl %ebp		# Standard function stuff:
				# We have to restore %ebp to its 
				# prior state before returning, so
				# we have to push it to the stack

	movl %esp, %ebp		# This is because we don't want to
				# modify the stack pointer, so we 
				# use %ebp (used to keep track the
				# function stuff -parameter, variables,
				# etc -)

	movl 8(%ebp), %eax	# This moves the first argument to %eax
				# 4(%ebp) holds the return address, and
				# 8(%ebp) holds the first parameter

	cmpl $1, %eax		# If the number is 1, that is our base
	je end_factorial	# case, and we simply return (1 is already 
				# in %eax as the return value)

	decl %eax		# Otherwise, decrease the value
	pushl %eax		# Push it for our call to factorial
	call factorial		# Call factorial in a recursive mode
	movl 8(%ebp), %ebx	# %eax has the return value, so we
				# reload our parameter into %ebx
	imull %ebx, %eax	# Multiply that by the result of
				# the last call to factorial (in %eax)
				# The answer is stored in %eax, which
				# is good, since that's where return values
				# go.

end_factorial:
	movl %ebp, %esp		# Standard function return stuff - we
	popl %ebp		# have to restore %ebp and %esp to where
				# they were before the function started
	ret			# Return to the function (this pops the
				# return value too)
