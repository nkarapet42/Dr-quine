section .note.GNU-stack

; Self-replicating comment

%define O_WRONLY 577

global main
extern printf
extern sprintf
extern fopen
extern fclose
extern fprintf
extern system
extern strcmp

section .rodata
CODE_STR db "section .note.GNU-stack%1$c%1$c; Self-replicating comment%1$c%1$c%%define O_WRONLY 577%1$c%1$cglobal main%1$cextern printf%1$cextern sprintf%1$cextern fopen%1$cextern fclose%1$cextern fprintf%1$cextern system%1$cextern strcmp%1$c%1$csection .rodata%1$cCODE_STR db %2$c%3$s%2$c, 0%1$c%1$cSRC_TEMPLATE db %2$cSully_%%d.s%2$c, 0%1$cOBJ_TEMPLATE db %2$cSully_%%d.o%2$c, 0%1$cEXEC_TEMPLATE db %2$cSully_%%d%2$c, 0%1$cCURRENT_FILE db __FILE__, 0%1$cOPEN_PERM db %2$cw%2$c, 0%1$cCOMPILE_TEMPLATE db %2$cnasm -f elf64 %%s && gcc -Wall -Wextra -Werror -no-pie -o %%s %%s && rm %%s%2$c, 0%1$cRUN_TEMPLATE db %2$c./%%s%2$c, 0%1$c%1$csection .data%1$cX_VALUE dq %4$d%1$cRUN_CMD times 200 db 0%1$cCOMPILE_CMD times 400 db 0%1$cOBJ_FILENAME times 100 db 0%1$cSRC_FILENAME times 100 db 0%1$cEXEC_FILENAME times 100 db 0%1$cCURRENT_FILENAME times 100 db 0%1$c%1$csection .text%1$cmain:%1$c    enter 0, 0%1$c    push rbp%1$c    mov rbp, rsp%1$c    sub rsp, 16%1$c    and rsp, -16%1$c    mov r12, qword[rel X_VALUE]%1$c%1$cstop_when_i_null:%1$c    cmp r12, 0%1$c    jle return%1$c%1$ccreate_current_name:%1$c    lea rdi, [rel CURRENT_FILENAME]%1$c    lea rsi, [rel SRC_TEMPLATE]%1$c    mov rdx, r12%1$c    call sprintf%1$c%1$ctry_accessing_file:%1$c    lea rdi, [rel CURRENT_FILENAME]%1$c    lea rsi, [rel CURRENT_FILE]%1$c    call strcmp%1$c    test rax, rax%1$c    jnz create_src_name%1$c    dec r12%1$c%1$ccreate_src_name:%1$c    lea rdi, [rel SRC_FILENAME]%1$c    lea rsi, [rel SRC_TEMPLATE]%1$c    mov rdx, r12%1$c    call sprintf%1$c%1$ccreate_exec_name:%1$c    lea rdi, [rel EXEC_FILENAME]%1$c    lea rsi, [rel EXEC_TEMPLATE]%1$c    mov rdx, r12%1$c    call sprintf%1$c%1$ccreate_obj_name:%1$c    lea rdi, [rel OBJ_FILENAME]%1$c    lea rsi, [rel OBJ_TEMPLATE]%1$c    mov rdx, r12%1$c    call sprintf%1$c%1$ccreate_file:%1$c    lea rdi, [rel SRC_FILENAME]%1$c    lea rsi, [rel OPEN_PERM]%1$c    call fopen%1$c    test rax, rax%1$c    jz return%1$c    mov r13, rax%1$c%1$c    mov rdi, r13%1$c    lea rsi, [rel CODE_STR]%1$c    mov rdx, 10%1$c    mov rcx, 34%1$c    lea r8, [rel CODE_STR]%1$c    mov r9, r12%1$c    call fprintf%1$c%1$c    mov rdi, r13%1$c    call fclose%1$c%1$ccreate_compile_cmd:%1$c    lea rdi, [rel COMPILE_CMD]%1$c    lea rsi, [rel COMPILE_TEMPLATE]%1$c    lea rdx, [rel SRC_FILENAME]%1$c    lea rcx, [rel EXEC_FILENAME]%1$c    lea r8, [rel OBJ_FILENAME]%1$c    lea r9, [rel OBJ_FILENAME]%1$c    call sprintf%1$c%1$ccreate_run_cmd:%1$c    lea rdi, [rel RUN_CMD]%1$c    lea rsi, [rel RUN_TEMPLATE]%1$c    lea rdx, [rel EXEC_FILENAME]%1$c    call sprintf%1$c%1$ccompile:%1$c    lea rdi, [rel COMPILE_CMD]%1$c    call system%1$c%1$crun_exec:%1$c    lea rdi, [rel RUN_CMD]%1$c    call system%1$c%1$creturn:%1$c    mov rsp, rbp%1$c    pop rbp%1$c    mov rax, 60%1$c    xor rdi, rdi%1$c    syscall", 0

SRC_TEMPLATE db "Sully_%d.s", 0
OBJ_TEMPLATE db "Sully_%d.o", 0
EXEC_TEMPLATE db "Sully_%d", 0
CURRENT_FILE db __FILE__, 0
OPEN_PERM db "w", 0
COMPILE_TEMPLATE db "nasm -f elf64 %s && gcc -Wall -Wextra -Werror -no-pie -o %s %s && rm %s", 0
RUN_TEMPLATE db "./%s", 0

section .data
X_VALUE dq 5
RUN_CMD times 200 db 0
COMPILE_CMD times 400 db 0
OBJ_FILENAME times 100 db 0
SRC_FILENAME times 100 db 0
EXEC_FILENAME times 100 db 0
CURRENT_FILENAME times 100 db 0

section .text
main:
    enter 0, 0
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov r12, qword[rel X_VALUE]

stop_when_i_null:
    cmp r12, 0
    jle return

create_current_name:
    lea rdi, [rel CURRENT_FILENAME]
    lea rsi, [rel SRC_TEMPLATE]
    mov rdx, r12
    call sprintf

try_accessing_file:
    lea rdi, [rel CURRENT_FILENAME]
    lea rsi, [rel CURRENT_FILE]
    call strcmp
    test rax, rax
    jnz create_src_name
    dec r12

create_src_name:
    lea rdi, [rel SRC_FILENAME]
    lea rsi, [rel SRC_TEMPLATE]
    mov rdx, r12
    call sprintf

create_exec_name:
    lea rdi, [rel EXEC_FILENAME]
    lea rsi, [rel EXEC_TEMPLATE]
    mov rdx, r12
    call sprintf

create_obj_name:
    lea rdi, [rel OBJ_FILENAME]
    lea rsi, [rel OBJ_TEMPLATE]
    mov rdx, r12
    call sprintf

create_file:
    lea rdi, [rel SRC_FILENAME]
    lea rsi, [rel OPEN_PERM]
    call fopen
    test rax, rax
    jz return
    mov r13, rax

    mov rdi, r13
    lea rsi, [rel CODE_STR]
    mov rdx, 10
    mov rcx, 34
    lea r8, [rel CODE_STR]
    mov r9, r12
    call fprintf

    mov rdi, r13
    call fclose

create_compile_cmd:
    lea rdi, [rel COMPILE_CMD]
    lea rsi, [rel COMPILE_TEMPLATE]
    lea rdx, [rel SRC_FILENAME]
    lea rcx, [rel EXEC_FILENAME]
    lea r8, [rel OBJ_FILENAME]
    lea r9, [rel OBJ_FILENAME]
    call sprintf

create_run_cmd:
    lea rdi, [rel RUN_CMD]
    lea rsi, [rel RUN_TEMPLATE]
    lea rdx, [rel EXEC_FILENAME]
    call sprintf

compile:
    lea rdi, [rel COMPILE_CMD]
    call system

run_exec:
    lea rdi, [rel RUN_CMD]
    call system

return:
    mov rsp, rbp
    pop rbp
    mov rax, 60
    xor rdi, rdi
    syscall