BITS 64

%include "strlen.s"

;void ft_putstr(char *str)
;{
;   write(1, str, strlen(str));
;}

putstr:
	call	strlen		; get length of rdi
	mov		rdx, rax	; move length to rdx
	mov		rax, 1		; select op code
	xchg	rsi, rdi	; inter-change
	mov		rdi, 0x1	; select fd
	syscall				; in (x86) int 0x80 - kernel interrupt