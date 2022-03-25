BITS 64

%include "add.s"

global _start

_start:
	mov		rdx, 2		;	decimal value converted to hex
	mov		rbx, 10		;	decimal value converted to hex
	call	add_nbr

	mov		rdx, 0x2	;	hex value
	mov		rbx, 0x10	;	hex value
	call	add_nbr

	mov		rax, 0x3c
	xor		rdi, rdi
	syscall
