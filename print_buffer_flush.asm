%ifndef PRINT_BUFFER_FLUSH
%define PRINT_BUFFER_FLUSH

print_buffer_flush:
; void print_buffer_flush(int {rdi});


	
	SYS_PUSH_SYSCALL_CLOBBERED_REGISTERS
	push rsi
	push rdx
	push rax

	mov rsi,PRINT_BUFFER
	.b:
	mov rdx,[PRINT_BUFFER_LENGTH] 
	.a:
	mov rax,SYS_WRITE 
	syscall
	xor rax,rax
	mov [PRINT_BUFFER_LENGTH],rax 

	
	pop rax
	pop rdx
	pop rsi
	SYS_POP_SYSCALL_CLOBBERED_REGISTERS

	ret	

PRINT_BUFFER_LENGTH: 
	dq 0	

%endif
