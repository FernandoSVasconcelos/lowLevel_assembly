section .data
codes:
    db      '0123456789ABCDEF'

section .text
global _start
_start:
    mov     rax, 0x1122334455667788

    mov     rdi, 1
    mov     rdx, 1
    mov     rcx, 64                 ; rcx is the register used to store the loop variable

.loop:
    push    rax                     ; push rax to the stack
    sub     rcx, 4

                                    ; cl is a register that contains the LSB of rcx
                                    ; rax -- eax -- ax -- ah + al
                                    ; rcx -- ecx -- cx -- ch + cl

    sar     rax, cl                 ; sar is the shift right command in x86_64 asm
    and     rax, 0xf                ; and operation with mask to isolate the nibble

    lea     rsi, [codes + rax]      ; rsi is the register that stores the vector index in the iteration
    mov     rax, 1

    push    rcx                     ; push rcx to the stack so the value don't get lost in the syscall
    syscall
    pop     rcx

    pop     rax
    test    rcx, rcx                ; check if rcx is equal 0 and set zf to 1 if so
    jnz     .loop                   ; jump if zf == 0
    mov     rax, 60
    xor     rdi, rdi
    syscall                         ; exit 0