matrix PROC							; получение матриц чисел из памяти, также применимо к буквам 

	MOV si, offset symbol_buffer
	MOV cx, 64
	clearbuf:
		MOV al, 0
		MOV [si], al
		inc si
	LOOP clearbuf
	
	PUSH es
	PUSHA
	mov ax, 1130h
	mov bh, 03h	; 8x8
	int 10h

	shl di, 3
	mov edx, dword ptr es:bp[di]

	mov cx, 32 						; количество битов в edx
	MOV si, offset symbol_buffer+32;

	next_bit:
		rol edx, 1 					; сдвигаем бит в CF
		adc byte ptr [si], 0
		inc si
		loop next_bit
	
	MOV cx, 32
	ADD di, 4
	mov edx, dword ptr es:bp[di]
	MOV si, offset symbol_buffer

	next_bit1:
		rol edx, 1 ; сдвигаем бит в CF
		adc byte ptr [si], 0 
		inc si 						; переходим к следующему байту buffer
	loop next_bit1
	
	MOV si, offset symbol_buffer	
	MOV di, offset revers_buffer + 64  	
	MOV cx, 8
	revers_loop:
		SUB di, 8
		PUSH di
		PUSH cx
		MOV cx, 8
		toarray:
			MOV al, [si]
			CMP al, 0
			JNE NOBLACK
			JMP RED
			NOBLACK:
			MOV al, 15
			RED:
			MOV [di], al
			INC di
			INC si
		LOOP toarray
		POP cx
		POP di
   	loop revers_loop 
   	
   	POPA
	POP es
	
  	MOV si, offset revers_buffer
  	RET
matrix ENDP