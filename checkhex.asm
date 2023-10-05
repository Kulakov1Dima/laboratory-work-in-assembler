hex PROC
	mov si, offset [buffer+2]
	mov ah, 02h
	
check_loop:
    mov dl, [si]
    
    cmp dl, '$'
    je done
    
    int 21h
        
    inc si
    jmp check_loop
    
done:
	ret

hex ENDP