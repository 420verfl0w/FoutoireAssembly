format ELF64 executable

include 'elf.inc'

segment readable writable
    virtual at rsp
        my mytest
        szmy = $ - rsp
    end virtual


segment readable executable

entry _start

_start:
    sub rsp, szmy
    mov byte [my.a], 0x1
    mov byte [my.b], 0x2
    add rsp, szmy
    
_exit:
    mov rax, 0x3c
    xor rdi, rdi
    syscall 