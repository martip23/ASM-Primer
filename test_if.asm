; hello.asm - basic NASM assembly language program

        bits 64
        global  main
        extern  puts

; declare variables (I know, 10 & 10 are equal)
        section .data
A       dd      10
B       dd      15
LC0     db      "TRUE", 0 
LC1     db      "FALSE", 0

        section .text
main:
        ; function setup
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        
	; user code goes here
        mov edx, [A] ; copy value in A to EDX
        mov eax, [B] ; copy value in B to EAX
        cmp edx, eax ; Compare A & B
        jle else    ; if A =< B, jump to else
        mov edi, LC0 ; move TRUE into edi
        jmp end ; do final operation

else:
        mov edi, LC1 ; if A !> B move FALSE into edi

end:
        ; function return
        call    puts ; output result
        mov     eax, 0
        add     rsp, 16
        pop     rbp
        ret

