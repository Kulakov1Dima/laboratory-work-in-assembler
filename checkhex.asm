hex PROC
    
    mov si, offset [buffer+2]	
	
str_loop:
    mov dl, [si]
  
    cmp dl, '$'
    je done
    
    cmp dl, 13
    je done

    cmp dl, 'h'
    je h_check
    
    cmp dl, 'H'
    je h_check
    
    jmp check
    
check:
    cmp dl, '0'
    jb not_hex  
    
    cmp dl, '9'
    ja hex_check
            
    inc si
    jmp str_loop
    
hex_check:
    cmp dl, 'A'
    jb mhex_check
    cmp dl, 'F'
    ja mhex_check
    
    inc si
    jmp str_loop
    
mhex_check:
    cmp dl, 'a'
    jb not_hex
    cmp dl, 'f'
    ja not_hex
    
    inc si
    jmp str_loop
    
h_check:
    inc si
    mov dl, [si]
    
    cmp dl, '$'
    je done
    
    cmp dl, 13
    je done

not_hex:
	print_s message3
    mov al, 0
	ret
    
done:
    mov al, 1
	ret

hex ENDP