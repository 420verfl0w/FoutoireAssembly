BITS 32

section .text

global _start

; nasm -f elf32 params_by_register.s && ld -m elf_i386 params_by_register.o -o params_by_register

params:
    dd 2
    dd 4

_start:
    mov edx, params
    call _sum

_sum:
    mov eax, [edx + 4]
    add eax, [edx]
    ret