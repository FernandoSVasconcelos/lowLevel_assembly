section .data
codes:
    db      '0123456789ABCDEF'

section .text
global _start
_start:
    mov     rsi, codes              ; rsi <- address of codes, a number
    mov     rsi, [codes]            ; rsi <- memory content, starting on the address of codes

    lea     rsi, [codes]            ; rsi <- address of codes
    mov     rsi, [codes + rax]      ; rsi <- memory content, starting in codes + rax
    lea     rsi, [codes + rax]      ; rsi <- codes + rax
                                    ; equal to the combination:
                                    ; -- mov rsi, codes
                                    ; -- add rsi, rax