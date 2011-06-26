#PURPOSE:	This program writes the message
#		"hello world" and exits

.include "./include/linux.s"

.section .data
	hello_world:
	.ascii "Hello World\n"
	hello_world_end:

	.equ hello_world_len, hello_world_end - hello_world

.section .text
	.globl _start

	_start:
		movl $STDOUT, %ebx
		movl $hello_world, %ecx
		movl $hello_world_len, %edx
		movl $SYS_WRITE, %eax
		int $LINUX_SYSCALL

		movl $0, %ebx
		movl $SYS_EXIT, %eax
		int $LINUX_SYSCALL
