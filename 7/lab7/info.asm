INFO PROC
	MOV si, OFFSET leftxlabel	
INFLX:						; label left x
	MOV ax, 0
	MOV al, [si]
	CMP al, '$' 
	JE EXITINFLX
	
	PUSH si
	CALL getChar
	MOV cx, 200				; x	
	MOV dx, 5					; y
	ADD cx, posx
	ADD posx, 10
	PUSH es
	mov ax, 0A000h 				; сегментный адрес видеопамяти
	mov es, ax
	CALL WRITE8X8
	POP es
	POP si
	inc si
	JMP INFLX
	
EXITINFLX:	
	MOV posx, 0

	MOV si, OFFSET rightxlabel	
INFRX:						; label left x
	MOV ax, 0
	MOV al, [si]
	CMP al, '$' 
	JE EXITINFRX
	
	PUSH si
	CALL getChar
	MOV cx, 190				; x	
	MOV dx, 18					; y
	ADD cx, posx
	ADD posx, 10
	PUSH es
	mov ax, 0A000h 				; сегментный адрес видеопамяти
	mov es, ax
	CALL WRITE8X8
	POP es
	POP si
	inc si
	JMP INFRX

EXITINFRX:	
	MOV posx, 0

	
	RET
INFO ENDP