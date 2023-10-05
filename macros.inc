
print_s MACRO msg
    mov ah, 9
    lea dx, msg
    int 21h
endm


input_s MACRO msg
    mov ah, 10
    lea dx, msg
    int 21h
endm

