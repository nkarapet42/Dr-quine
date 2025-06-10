; Self-replicating comment

%define SYS_OPEN 2
%define SYS_CLOSE 3
%define O_WRONLY 577

%macro EXECUTE 0
global _start
extern dprintf

section .rodata
filename db "Grace_kid.s", 0
code_str db "; Self-replicating comment%1$c%1$c%%define SYS_OPEN 2%1$c%%define SYS_CLOSE 3%1$c%%define O_WRONLY 577%1$c%1$c%%macro EXECUTE 0%1$cglobal _start%1$cextern dprintf%1$c%1$csection .rodata%1$cfilename db %2$cGrace_kid.s%2$c, 0%1$ccode_str db %2$c%3$s%2$c, 0%1$c%1$csection .text%1$c_start:%1$c    push rbp%1$c    mov rbp, rsp%1$c    sub rsp, 16%1$c    and rsp, -16%1$c    mov rax, SYS_OPEN%1$c    lea rdi, [rel filename]%1$c    mov rsi, O_WRONLY%1$c    mov rdx, 0777o%1$c    syscall%1$c    cmp rax, 0%1$c    jl exit%1$c    mov rdi, rax%1$c    lea rsi, [rel code_str]%1$c    mov rdx, 10%1$c    mov rcx, 34%1$c    lea r8, [rel code_str]%1$c    call dprintf%1$c    mov rax, SYS_CLOSE%1$c    syscall%1$cexit:%1$c    mov rsp, rbp%1$c    pop rbp%1$c    mov rax, 60%1$c    xor rdi, rdi%1$c    syscall%1$c%%endmacro%1$c%1$cEXECUTE", 0

section .text
_start:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, SYS_OPEN
    lea rdi, [rel filename]
    mov rsi, O_WRONLY
    mov rdx, 0777o
    syscall
    cmp rax, 0
    jl exit
    mov rdi, rax
    lea rsi, [rel code_str]
    mov rdx, 10
    mov rcx, 34
    lea r8, [rel code_str]
    call dprintf
    mov rax, SYS_CLOSE
    syscall
exit:
    mov rsp, rbp
    pop rbp
    mov rax, 60
    xor rdi, rdi
    syscall
%endmacro

EXECUTE