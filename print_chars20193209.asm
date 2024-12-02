%ifndef PRINT_CHARS20193209
%define PRINT_CHARS20193209

; dependency
%include "print_buffer_flush.asm"
; also requires PRINT_BUFFER and its PRINT_BUFFER_SIZE to be defined

print_chars20193209:
; void print_chars(int {rdi}, char* {rsi}, uint {rdx});
; 	Writes {rdx} chars of char array starting at {rsi} to file
;	descriptor {rdi}.

	push rsi
	push rdx
	push rcx
	push rax
	push r8

	mov rax, PRINT_BUFFER
	add rax, [PRINT_BUFFER_LENGTH]

	mov r8, PRINT_BUFFER
	add r8, PRINT_BUFFER_SIZE

	mov rcx, rax
.loop_write:
    mov byte [rax], dl
    inc rax
    cmp rax, r8
    jne .no_flush
    mov rdx, PRINT_BUFFER_SIZE
    mov [PRINT_BUFFER_LENGTH], rdx
    call print_buffer_flush
    mov rax, PRINT_BUFFER
.no_flush:
    loop .loop_write

    sub rax, PRINT_BUFFER
    mov [PRINT_BUFFER_LENGTH], rax

	pop r8
	pop rax
	pop rcx
	pop rdx
	pop rsi

	ret

%endif