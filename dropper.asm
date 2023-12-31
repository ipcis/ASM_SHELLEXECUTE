    bits 64
    default rel

segment .data
    msg_hello   db  "Hello world!", 0xd, 0xa, 0
    msg_exec_addr   db  "exec_mem addr", 0
    msg_pload_addr  db  "payload addr", 0   
    msg_format  db  "%-20s : 0x%-016p", 0xd, 0xa, 0
    msg_hit_me  db  "Hit me!", 0xd, 0xa, 0

    ;; 4 byte payload
    payload     db  0x90, 0x90, 0xCC, 0xC3
    payload_len     db  4

segment .bss    
    exec_mem    resb    8
    old_protect resb    8   

segment .text
    global main
    extern ExitProcess
    extern printf
    extern VirtualAlloc
    extern VirtualProtect
    extern RtlMoveMemory
    extern getchar
    extern CreateThread
    extern WaitForSingleObject

main:
    push    rbp
    mov     rbp, rsp

    ;; Allocate a memory buffer for payload.
    mov rcx, 0
    xor rdx, rdx
    mov dl, [payload_len]
    mov r8, 0x3000
    mov r9, 0x4
    sub     rsp, 32 
    call    VirtualAlloc
    add     rsp, 32 

    mov [exec_mem], rax

    lea     rcx, [msg_format]
    lea rdx, [msg_pload_addr]
    lea r8, payload
    sub     rsp, 32 
    call    printf
    add     rsp, 32 

    lea     rcx, [msg_format]
    lea rdx, [msg_exec_addr]
    mov r8, [exec_mem]
    sub     rsp, 32

    call    printf
    add     rsp, 32 

    ;; Copy payload to new buffer
    mov rcx, [exec_mem]
    lea rdx, [payload]
    xor r8, r8
    mov r8b, [payload_len]
    sub     rsp, 32     
    call    RtlMoveMemory
    add     rsp, 32 

    ;; Make new buffer as executable
    mov rcx, [exec_mem]
    xor rdx, rdx
    mov dl, [payload_len]
        mov r8, 0x20
    xor r9, r9
    lea r9, [old_protect]
    sub     rsp, 32     
    call    VirtualProtect
    add     rsp, 32

    push    rax

    lea     rcx, [msg_hit_me]
    sub     rsp, 32         
    call    printf
    add     rsp, 32 

    sub     rsp, 32             
    call    getchar
    add     rsp, 32

    pop rax

    ;; If all good, run the payload 
    jz  ifrvzero

    xor rcx, rcx
    xor rdx, rdx
    mov r8, [exec_mem]
    xor r9, r9
    push    r9
    push    r9
    call    CreateThread

    mov rcx, rax
    mov rdx, 0xFFFFFFFF
    call    WaitForSingleObject

ifrvzero:

    xor     rax, rax
    call    ExitProcess