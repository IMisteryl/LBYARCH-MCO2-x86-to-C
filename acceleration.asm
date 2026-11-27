%include "io64.inc"

section .data
    sample dq 5.5, 4.5, 3
    fmt db "Result: %f", 10, 0

section .bss
    result resq 10000
    
section .text
extern printf
global compute_acceleration
compute_acceleration:
    ;(V_final - V_initial) / time
    
    mov rcx, 0
    movsd xmm0, [sample + rcx*8] ; V_final
    inc rcx
    movsd xmm1, [sample + rcx*8] ; V_initial
    inc rcx
    movsd xmm2, [sample + rcx*8] ; time
    
    subsd xmm0, xmm1
    divsd xmm0, xmm2
    
    movsd [result], xmm0
    
    sub rsp, 8
    mov rdi, fmt
    mov al, 1
    call printf
    add rsp, 8
    
    xor rax, rax
    ret