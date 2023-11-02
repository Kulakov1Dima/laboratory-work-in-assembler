DEGREE PROC

    add current, -48

    cmp current, 9
    jg greater
    jmp nogreater

    greater:
    ADD current, -7
    nogreater:

    movzx dx, current
    mov ax, deg
    mul dx

    mov ax, deg
    mov dx, 16
    mul dx
    mov deg, ax

    RET
DEGREE ENDP