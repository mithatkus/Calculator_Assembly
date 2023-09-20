	.intel_syntax noprefix
	.section .text
	.global OR_ALL
OR_ALL:
	or rax, QWORD PTR[rbx] #diong the bitwise or operation and saving the result in rax
	add rbx, 8 #incrementing the memory address by 8
	ret
