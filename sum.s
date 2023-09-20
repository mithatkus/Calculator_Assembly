	.intel_syntax noprefix
	.section .data
	.global SUM_N
	.global SUM_P
	
#allocating space in memory for positive and negative cases
	
SUM_N:	.quad 0
SUM_P:	.quad 0

	.section .text
	.global SUM_ALL

SUM_ALL:
	add rax, QWORD PTR [rbx] #summing and stroing the value in rax
	mov r15, QWORD PTR [rbx]
	cmp QWORD PTR [rbx], 0
	jl is_neg #checking if the result is negative
	add SUM_P, r15 #if positive we store it in SUM_P
	jmp done_cond
is_neg:
	add SUM_N, r15 #if negative we store it in SUM_N
	jmp done_cond
done_cond:
	add rbx, 8 #before returning we increment rbx by 8 so that it has the memory address for the memory address that is 8 bytes ahead
	ret
