        .intel_syntax noprefix
	.global calc
calc:
	xor rax, rax
	xor rdi, rdi
	mov rbx, OFFSET [CALC_DATA_BEGIN]

loop_start:
	cmp QWORD PTR [rbx], 0
	je loop_done
	add rbx, 8
	jmp loop_start
loop_done:
	syscall
