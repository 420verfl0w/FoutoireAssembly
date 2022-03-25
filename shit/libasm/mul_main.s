BITS 64

%include "mul.s"

global _start

_start:
	mov		rdx, 0x6
	mov		rbx, 0x4
	call	mul_nbr

	mov		rdx, -0x6	; negative can be written like this
	mov		rbx, 0x4
	call	mul_nbr

	mov		rax, 0x3c
	xor		rdi, rdi
	syscall
