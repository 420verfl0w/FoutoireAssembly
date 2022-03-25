BITS 64

%include "sub.s"

global _start

_start:
	mov		rdx, 0x6
	mov		rbx, 0x4
	call	sub_nbr

	mov		rdx, 0x2		; test for negative numbers
	mov		rbx, 0x4
	call	sub_nbr
							; intersting result
							; negative number have lot of "f" on
							; most significative bytes
	mov		rax, 0x3c
	xor		rdi, rdi
	syscall
