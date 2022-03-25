BITS 64

add_nbr:
	xor		rax, rax ; rax = 0
	add		rax, rdx
	add		rax, rbx
	ret
