section .data
message: db 'Hello, world!', 10

section .text
global _start

_start:
    mov     rax, 1          ; rax contains the process number for syscall
    mov     rdi, 1          ; rdi contains the parameter to be sent for the syscall
    mov     rsi, message
    mov     rdx, 14         ; parameter for the syscall
    syscall

    mov     rax, 60         ; parameter for the syscall
    xor     rdi, rdi        ; parameter for the syscall
    syscall                 ; syscall will be an exit 0