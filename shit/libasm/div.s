BITS 64

div_nbr:
	mov		rax, rdx	; store dividend on rax
	xor		rdx, rdx	; clear rdx or SIGFPE appears
	div		rbx			; store divisor on rbx
	ret

	; rdx will contains the remainder
	; rax will contains the quotient
