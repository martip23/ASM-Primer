        bits 64
        global  main
        extern  puts

; declare variables (I know, 10 & 10 are equal)
        section .data
A       dd      0
B       dd      3
LC0     db      "COUNTING", 0 

        section .text
main:
        ; function setup
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        
	; user code goes here
        jmp end ; jump to end where compare is

whileTrue:
        mov edi, LC0
        call    puts
        mov eax, [A]
        inc eax
        mov [A], eax

end:
        mov edx, [A] ; move A into edx
        mov eax, [B] ; move B into edx
        cmp edx, eax ; compare
        jl whileTrue ; if less than, jump to while
                ; while will return here
        
        ;function return
        mov     eax, 0
        add     rsp, 16
        pop     rbp
        ret
