
macro print_s msg
    mov ah, 9
    lea dx, msg
    int 21h
endm