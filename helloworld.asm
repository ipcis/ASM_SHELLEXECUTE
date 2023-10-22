bits 64
default rel

section .data
    msg db "Hello world!", 0xa, 0
    msglen equ $ - msg

section .text
global main
extern ExitProcess
extern printf

main:
    push rbp
    mov rbp, rsp
    sub rsp, 32

    lea rcx, [rel msg]
    call printf

    xor rax, rax
    call ExitProcess
