section .data

newline_char: db 10
codes: db '0123456789abcdef'

section .text
global _start

print_newline:
    mov     rax, 1                  ; syscall write id
    mov     rdi, 1                  ; stdout file id
    mov     rsi, newline_char       ; data for the syscall write
    mov     rdx, 1                  ; number of bytes to write
    syscall
    ret

print_hex:
    mov     rax, 1
    mov     rdx, 1
    mov     rcx, 64                 ; rax shift

iterate:
    push    rax                     ; push rax initial value to stack
    sub     rcx, 4
    sar     rax, cl                 ; shift for 60, 56, 52, ..., 4, 0
                                    ; cl is the lower part of rcx
    and     rax, 0xf                ; clear all the bits, except the 4 less significative
    mov     rsi, codes      ; get one hex digit code

    mov     rax, 1
    mov     rdi, 1
    push    rcx                     ; syscall will change rcx, so push it to the stack
    syscall                         ; rax = 1, syscall write
                                    ; rdi = 1, stdout file
                                    ; rsi = adress of one char

    pop     rcx
    pop     rax
    test    rcx, rcx                ; rcx = 0 when all the digits are shown
    jnz     iterate

    ret

_start:
    mov     rdi, 0x1122334455667788
    call    print_hex
    call    print_newline

    mov     rax, 60
    xor     rdi, rdi
    syscall