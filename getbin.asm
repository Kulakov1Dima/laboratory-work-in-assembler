binary PROC
    mov si, offset [buffer+2]
    print_s done_message
str_loop1:
        mov dl, [si]
        cmp dl, '$'
        je done
    
        cmp dl, 13
        je done
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
        inc si
    jmp str_loop1

done1:
    ret
binary ENDP