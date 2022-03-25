BITS 64

strlen:
		push rdi 			; save rdi
		xor rcx, rcx 		; set rcx to 0
		not rcx 			; set -1 on rcx because scasb decrement rcx and increment rdi
		xor al, al 			; set al to 0
		cld 				; clear direction flag
repne	scasb 				; repeat scasb until ecx is equal to 0 or NULL byte is found in rdi
		not rcx 			; re-switch operator with NOT operator
		pop rdi 			; restore rdi
		lea rax, [rcx - 1]	; store rcx in rax, value which mean represent length of string
		ret					; return procedure from a call