; hello.asm - basic NASM assembly language program

        bits 64
        global  main
        extern  puts

; declare variables (I know, 10 & 10 are equal)
        section .data
A       dd      12
B       dd      18
LC0     db      "TRUE"
LC1     db      "FALSE"

        section .text
main:
        ; function setup
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        
	; user code goes here
        mov edx, A
        mov eax, B
        cmp edx, eax
        jle else
        mov edi, LC0
        call    puts
        jmp end

else:
        mov edi, LC1
        call    puts

end:
        ; function return
        mov     eax, 0
        add     rsp, 16
        pop     rbp
        ret

