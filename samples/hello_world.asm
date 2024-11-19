.global _start

.section .data
message: .ascii "Hello from Assembly!\n"

.section .text
_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, offset message
    mov rdx, 21
    syscall
 
    mov rax, 60
    mov rdi, 0
    syscall
