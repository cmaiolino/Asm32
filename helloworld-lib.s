# PURPOSE:	This program writes the message "hello world"
#		and exits, making use of shared libraries

.section .data
	hello_world:
		.ascii "hello world\n\0"

.section .text
	.globl _start

	_start:
		push $hello_world
		call printf

		push $0
		call exit
