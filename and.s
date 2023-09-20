	.intel_syntax noprefix
	.section .text
	.global AND_ALL
AND_ALL:
	and rax, QWORD PTR[rbx] #doing the bitwise and operation and storing the result in rax
	add rbx, 8 #incrementing the memory address by 8
	ret
