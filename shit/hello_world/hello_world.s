; Title     : Hello world
; Assembly  : NASM
; Target    : Linux - x86_64
; Author    : S4M0verfl0w
; Created   : 24/03/2022 20:39:10
; Compile with ld  : nasm -f elf64 hello_world.s && ld hello_world.o -o hello
; Compile with gcc : nasm -f elf64 hello_world.s && gcc hello_world.o -nostartfiles --entry=_start -o hello

BITS 64

section .data
    msg db "hello", 0
    len equ $-msg

section .text

global _start

_start:
    mov rax, 0x1
    mov rdi, 0x1
    mov rsi, msg
    mov rdx, len
    syscall
    jmp _exit

_exit:
    mov rax, 0x3c
    xor rdi, rdi
    syscall