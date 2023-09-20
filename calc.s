	.intel_syntax noprefix
	.section .data

RAX_FLAG:	.quad 0 #allocating space in memory to put the value in rax
Total:		.quad 0 #allocating space in memory to save the difference of CALC_DATA_BEGIN and CALC_DATA_END

	.section .text
	.global _start
_start:
	xor rax, rax
	mov rbx, OFFSET [CALC_DATA_BEGIN] #put memory address of data begin in rbx
	jmp loop_start

#looping until we come across the value zero. If 'U', '&', '|' or 'S' is found, we jump to their specific loops that call the necessary functions	
loop_start:
	
	cmp QWORD PTR[rbx], 0
	jz standard_out

	cmp QWORD PTR [rbx], 'U'
	je up_check
	
	cmp QWORD PTR[rbx],'&
	je and_check
	
	cmp QWORD PTR[rbx], '|'
	je or_check
	
	cmp QWORD PTR[rbx], 'S'
	je sum_check

	add rbx, 8
	jmp loop_start

#calls the function to make lowercase letters uppercase and jumps back to main loop
up_check:
	add rbx, 8
	call UPS
	jmp loop_start

#calls the function that does bitwise and operation and jumps back to main loop
and_check:
	add rbx, 8
	call AND_ALL
	jmp loop_start

#calls the function that does bitwise or operation and jumps back to main loop
or_check:
	add rbx, 8
	call OR_ALL
	jmp loop_start

#calls the function that does summation and jumps back to main loop
sum_check:
	add rbx, 8
	call SUM_ALL
	jmp loop_start

#making the necessary adjustments to succesfully write to standard out
standard_out:
	mov QWORD PTR [RAX_FLAG], rax #saving what's in rax to a place in memory
	mov rax, 1
	mov rdi, 1
	mov rsi, OFFSET [RAX_FLAG] #saving the memory address of that place in memory
	mov rdx, 8
	syscall

	mov rax, 1
	mov rdi, 1
	mov rsi, OFFSET [SUM_P] #saving the memory address
	mov rdx, 8
	syscall

	mov rax, 1
	mov rdi, 1
	mov rsi, OFFSET [SUM_N] #saving the memory address
	mov rdx, 8
	syscall

	mov rax, 1
	mov rdi, 1
	xor r9, r9
	xor r10, r10
	mov r9, OFFSET [CALC_DATA_BEGIN]
	mov r10, OFFSET [CALC_DATA_END]
	add Total, r10
	sub Total, r9 #saving the difference between memory adresses CALC_DATA_BEGIN and CALC_DATA_END
	mov rsi, OFFSET CALC_DATA_BEGIN #saving the memory address of the start
	mov rdx, QWORD PTR[Total] #passing the end value to rdx
	syscall

	mov rax, 60 
	mov rdi, 0
	syscall #invoking operating system to exit
	
	
