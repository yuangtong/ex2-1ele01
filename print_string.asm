%ifndef PRINT_STRING
%define PRINT_STRING

; dependency
%include "print_chars20193209.asm"

print_string:
; void print_string(int {rdi}, char* {rsi});
; 	Writes null-terminated char array starting at {rsi} to file
;	descriptor {rdi}.

	push rdx


	mov rdx,-1
.print_string_loop:
	inc rdx
	cmp byte [rsi+rdx],0
	jne .print_string_loop

	call print_chars20193209

	pop rdx

	ret

%endif
