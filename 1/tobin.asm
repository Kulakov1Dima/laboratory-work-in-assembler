TOBIN PROC
    mov si, offset [buffer+2]
    lea di, outbin
    print_s done_message
    
str_loop1:
        mov dl, [si]
        b0
        b1
        b2
        b3
        b4
        b5
        b6
        b7
        b8
        b9
        b10
        b11
        b12
        b13
        b14
        b15

        cmp dl, '$'
        je done1
    
        cmp dl, 13
        je done1
        inc si

    jmp str_loop1

done1:
    mov al, 1
    ret
TOBIN ENDP