CREATE_FIELD PROC

	PUSH es
	mov ax, 0A000h 			; сегментный адрес видеопамяти для 13 режима
	mov es, ax
	
MOV cx, 220				; ширина
RECTX:
	MOV dx, 170
	RECTY:	
		PUSH dx
		MOV ax, 320
		MUL dx
		MOV di, ax
		ADD di, cx

		MOV al, 0Fh
		MOV es:[di], al	
	
		POP dx
		INC dx
		CMP dx, 199
		JNE RECTY
		DEC cx
	CMP cx, 2
	JAE RECTX
	
	POP es
	RET
CREATE_FIELD ENDP