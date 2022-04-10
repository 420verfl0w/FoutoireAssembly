;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;     By s4m0verfl0w Aka Stackz
;;       CPUID TEST - 01
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; REF : https://en.wikipedia.org/wiki/CPUID

BITS 64

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;          MACROS
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

%macro  write 2
    mov rax, 0x1        ; write system call
    mov rdi, 0x1        ; STDOUT
    mov rsi, %1         ; char *
    mov rdx, %2         ; size_t
    syscall             ; fast system call
%endmacro

section .data
    avx db "AVX", 0
    avx_len equ $-avx
    avx2 db "AVX2", 0
    avx2_len equ $-avx2
    avx_512 db "AVX 512", 0
    avx_512_len equ $-avx_512

section .text           ; Section contains CPU Instruction

global _start           ; Entry point of program

_start:
    ; Check CPU Features
    xor rax, rax
    or rax, 1
    cpuid
    
    ;Check AVX EXT
    xor r9, r9
    or r9, 1
    shl r9, 28
    and rcx, r9
    cmp rcx, 0
    je _exit
    write avx, avx_len
    
    ; CHECK AVX2 EXT
    xor r9, r9
    xor rcx, rcx    ;   Ext features
    mov rax, 7
    shl r9, 5       ; AVX2
    and rbx, r9
    cmp rbx, 0
    je _exit
    write avx2, avx2_len

    ; CHECK AVX 512 EXT
    xor r9, r9
    xor rcx, rcx
    mov rax, 7
    shl r9, 16
    and rbx, r9
    cmp rbx, 0
    je _exit
    write avx_512, avx_512_len

_exit:
    mov rax, 0x3c   ; exit system call
    xor rdi, rdi
    syscall