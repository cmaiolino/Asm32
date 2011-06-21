.include "../include/record-def.s"
.include "../include/linux.s"

#PURPOSE:	This function reads a  record from the file
#		descriptor
#
#INPUT:		The file descriptor and a buffer
#
#OUTPUT:	This function writes the data to the buffer
#		and returns a status code
#
# READ STACK LOCAL VARIABLES
 .equ ST_READ_BUFFER, 8
 .equ ST_FILEDES,12

# WRITE STACK LOCAL VARIABLES
 .equ ST_WRITE_BUFFER, 8

.section .text
.globl read_record
.type read_record, @function

.globl write_record
.type write_record, @function

# READ_RECORD function
read_record:
push %ebp
movl %esp, %ebp

pushl %ebx
movl ST_FILEDES(%ebp), %ebx
movl ST_READ_BUFFER(%ebp), %ecx
movl $RECORD_SIZE, %edx
movl $SYS_READ, %eax
int $LINUX_SYSCALL

#NOTE:	%eax has the return value, which we will
#	give back to our calling program

popl %ebx

movl %ebp, %esp
popl %ebp
ret

#WRITE_RECORD FUNCTION
write_record:

pushl %ebp
movl %esp, %ebp

#write syscall
pushl %ebx
movl $SYS_WRITE, %eax
movl ST_FILEDES(%ebp), %ebx
movl ST_WRITE_BUFFER(%ebp), %ecx
movl $RECORD_SIZE, %edx
int $LINUX_SYSCALL

#NOTE:	%eax has the return value, which we will
#	give back to our calling program
popl %ebx

movl %ebp, %esp
popl %ebp
ret
