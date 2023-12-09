section .data
example2:
    db      'FEDCBA987654321'
example1:
    db      '0123456789ABCDEF'


section .text
global _start
_start:

    cmp     rax, 2
    jl      yes
    mov     rbx, 0
    jg      ex

yes:
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, example1
    mov     rdx, 14
    syscall

ex:
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, example2
    mov     rdx, 14
    syscall

; ja jump if above
; jb jump if bellow
; jg jump if greater or equal
; jl jump if less
; jae jump if above or equal
; jle jump if less of equal
; test does an and between the two values
; cmp subs the two values