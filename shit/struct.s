BITS 64


section .data
struc person
    name    resb 8
    age     resb 4
endstruc

mystruct:
    istruc person
        at name, db "hello"
        at age, dd 12
    iend

global _start

section .text

_start:
    sub rsp, 0x10
    mov qword [rsp], mystruct
    mov rdx, [mystruct+age]
    jmp _exit

_exit:
    mov rax, 0x3c
    xor rdi, rdi
    syscall
