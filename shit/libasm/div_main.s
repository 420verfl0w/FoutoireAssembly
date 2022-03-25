BITS 64

%include "div.s"

global _start

_start:
	mov		rdx, 0xFA		; quotient = 250
	mov		rbx, 0x19		; divisor  = 25
	call	div_nbr

	mov		rdx, 0xFE		; quotient = 255
	mov		rbx, 0x19		; divisor  = 25
	call	div_nbr

	mov		rax, 0x3c
	xor		rdi, rdi
	syscall
