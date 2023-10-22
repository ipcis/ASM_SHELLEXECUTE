extern MessageBoxA
extern ExitProcess
global start

section .data
    title db "MessageBox Example",0
    message db "Hello, MessageBox!",0

section .text

start:
    sub   RSP, 8                                   ; Align the stack to a multiple of 16 bytes
    sub   RSP, 32                                  ; 32 bytes of shadow space

    ; Set up the parameters for the MessageBox function.
    mov rcx, 0           ; hWnd (NULL, da keine Elternfenster)
    mov rdx, title       ; lpCaption
    mov r8, message      ; lpText
    mov r9d, 0x40        ; uType (MB_OK)

    ; Call the MessageBox function.
    call MessageBoxA

    ; Check the return value of MessageBox (not required but optional).
    test rax, rax
    jz .error

    ; Successful MessageBox display, exit the program.
    call ExitProcess

.error:
    ; Error handling (e.g., in case of a failed MessageBox call).
    call ExitProcess
