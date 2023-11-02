include labs/1/deg.asm

GETDEC PROC
    MOV si, offset [buffer+2]
    ADD si, cx
    DEC si ;конец строки
    
    LEN:
    PUSH cx
    mov dl, [si]
    mov current, dl
    
    CALL DEGREE

    add dword ptr [decnum], edx
    MOV al, 1

    CMP decnum, 65535
    ;JG not_above_limit

    POP cx
    DEC si
    LOOP LEN
    JMP next

not_above_limit:
    POP cx
    print_s message4
    mov al, 0

next:
    RET
GETDEC ENDP