CREATE_GRID PROC

	PUSH es
	mov ax, 0A000h 			; сегментный адрес видеопамяти для 13 режима
	mov es, ax
	
	
	MOV cx, 310
LINEX:
	MOV dx, 1
	LINEY:	
		PUSH dx
		MOV ax, 320
		MUL dx
		MOV di, ax
		ADD di, cx
		CMP cx, 160
		MOV al, 0
		JNE NXCOLOR
		MOV al, 14
		NXCOLOR:
		MOV es:[di], al	
	
		POP dx
		INC dx
		CMP dx, 199
		JNE LINEY
		ADD cx, -10
	CMP cx, 10
	JAE LINEX
	
	MOV cx, 190
LINEY1:
	MOV dx, 1
	LINEX1:	
		PUSH dx
		MOV ax, 320
		MUL cx
		POP dx
		MOV di, ax
		ADD di, dx
		CMP dx, 160
		MOV al, 0
		JNE NXCOLOR1
		MOV al, 14
		NXCOLOR1:
		CMP cx, 100
		JNE NYCOLOR1
		MOV al, 2
		NYCOLOR1:
		MOV es:[di], al	
	
		INC dx
		CMP dx, 319
		JNE LINEX1
		ADD cx, -10
	CMP cx, 10
	JAE LINEY1
	POP es
	RET
CREATE_GRID ENDP