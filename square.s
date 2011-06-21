.section .data

.section .text

.globl square_function
.globl _start

_start:
push $4 		# The number to be squared of
call square_function

addl $4, %esp
movl %eax, %ebx

movl $1, %eax

int $0x80

.type square_function, @function

square_function:
pushl %ebp
movl %esp, %ebp

subl $4, %esp

movl 8(%ebp), %ebx 
movl %ebx, -4(%ebp)
movl -4(%ebp), %eax
imull %ebx, %eax

movl %ebp,%esp
popl %ebp
ret
