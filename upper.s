	.intel_syntax noprefix
	.section .text

	.global UPS
UPS:
	xor rdi, rdi
	mov rdx, QWORD PTR [rbx] #passing what is at memory address value found at rbx to rdx
	push rax #pushing what is in rax to the top of the stack to store it in a safe way

#figures out if the current value needs to be turned into uppercase. if so we subtract 32 from the current value to make the necessary change. if not we jump to another function.	
iter:
	mov al, BYTE PTR [rdi + rdx]
	cmp al, 0
	jz done_cond
	cmp al, 'a
	jb U
	cmp al, 'z
	ja U
	sub al, 32
	mov BYTE PTR [rdi + rdx], al
	inc rdi
	jmp iter

#increments our index stored in rdi and jumps back to the main loop
U:
	inc rdi
	jmp iter
	
done_cond:
	pop rax #we take back what we stored at the top of the stack
	add rax, rdi #we add to rax the value that represents the number of characters we processed during this loop
	ret
