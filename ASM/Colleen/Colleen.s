section .note.GNU-stack

; Outside comment

global main
extern printf

section .rodata
code_str db "section .note.GNU-stack%1$c%1$c; Outside comment%1$c%1$cglobal main%1$cextern printf%1$c%1$csection .rodata%1$ccode_str db %2$c%3$s%2$c, 0%1$c%1$csection .text%1$cmain:%1$c    enter 0, 0%1$c    lea rdi, [rel code_str]%1$c    ; Inside comment%1$c    mov rsi, 10%1$c    mov rdx, 34%1$c    lea rcx, [rel code_str]%1$c    call printf%1$c    call do_nothing%1$c    leave%1$c    call return%1$c%1$creturn:%1$c    ret%1$c%1$cdo_nothing:%1$c    ret", 0

section .text
main:
    enter 0, 0
    lea rdi, [rel code_str]
    ; Inside comment
    mov rsi, 10
    mov rdx, 34
    lea rcx, [rel code_str]
    call printf
    call do_nothing
    leave
    call return

return:
    ret

do_nothing:
    ret