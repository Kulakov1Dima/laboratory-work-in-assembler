load_data MACRO
    MOV ax,@DATA
    MOV ds,ax
endm

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

my_start MACRO input, output
    load_data
    print_s input
    input_s output
endm

convernt MACRO
    MOV cx, 6
    MOV si, offset DIGITS
    MOV di, offset VALUES

    L1:
        CMP dx, [si]
        JZ FOUND
        INC si
        INC di
        LOOP L1
    JMP EXIT

    FOUND:
        MOV dx, [di]
    EXIT:
endm


