        bits 64
        global  main
        extern  puts

; declare variables (I know, 10 & 10 are equal)
        section .data
A       dd      5
B       dd      7
LC0     db      "COUNTING", 0 

        section .text
main:
        ; function setup
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        
	; user code goes here
        mov [A], byte 0
        jmp end ; jump to end where compare is

forTrue:
        mov edi, LC0
        call    puts
        mov eax, [A]
        inc eax
        mov [A], eax

end:
        mov eax, [A] ; move A into edx
        cmp eax, 2 ; compare
        jle forTrue ; if less than, jump to while
                ; while will return here
        
        ;function return
        mov     eax, 0
        add     rsp, 16
        pop     rbp
        ret
