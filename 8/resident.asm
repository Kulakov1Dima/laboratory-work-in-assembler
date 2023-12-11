new_int16h proc
    cmp ah, 0
    jne next
    cmp al, 'p'
    jne next
    mov dx, offset res_msg
    mov ah, 9
    int 21h
    mov ax, 3100h
    int 21h
next:
    mov ax, 3516h
    int 21h
    mov old_int16h, bx
    mov old_int16h+2, es
    mov ah, 25h
    mov dx, offset new_int16h
    int 21h
    ret
new_int16h endp


resident PROC
	
RET
resident ENDP
