BITS 64

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;		TAKE CARE NOT OPTIMIZED
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;		PSEUDO C CODE
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;char	*ft_hex(char *dst, char *src, size_t len)
;{
;	char *tmp = dst;
;	while (len--) {
;		*tmp++ = HEX_TAB[*src >> 4];
;		*tmp++ = HEX_TAB[*src++ & 0xF];
;	}
;	*tmp = 0;
;	return (dst);
;}

hex_tab db "0123456789abcdef", 0

to_hex:
	sub rsp, 0x8 				; create pointer
	mov qword [rsp], rdi		; create tmp ptr on dest buf

to_hex_loop:
	mov r8, hex_tab 			; defines hex_tab
	test rdx, rdx				; check if rdx is 0 or not
	je to_hex_end				; if equal to 0 jump to_hex_end
	mov rax, qword [rsp]		; rax take pointer on the stack
	mov r10b, byte [rsi]		; r10 take first byte of rsi
	sar r10b, 4					; and rotate to the right of 4 bits to take first value of Hexadecimal char
	add r8, r10					; add this value to the hex table
	mov r9, [r8]				; this value and dereference it to access value and store it in r9
	mov byte [rax], r9b			; put first hex char in tmp -> buffer
	sub r8, r10					; restore hex_tab
	mov r10b, byte [rsi]		; r10 take first byte of rsi
	and r10b, 0xF				; take 4 LSB bits in r10b to get second value of Hexadecimal char
	add r8, r10					; add this value to the hex table
	mov r9, [r8]				; dereference it... etc.. is the same
	mov byte [rax + 0x1], r9b	; place second value of hexadecimal char in buf
	add rax, 0x2				; move pointer of 2 bytes
	mov qword [rsp], rax		; push on the stack
	inc rsi						; rsi++
	dec rdx						; size--
	jmp to_hex_loop				; re jump to the begining of the loop

to_hex_end:
	mov byte [rax], 0x0 		; define a null-terminated string for our eyes
	add rsp, 0x8				; remove pointer on the stack (IMPORTANT else Instruction pointer point to the buf)
	xchg rax, rdi				; exchange register rdi to rax, and rax to rdi
	ret							; ret (pop rip) return procedure call