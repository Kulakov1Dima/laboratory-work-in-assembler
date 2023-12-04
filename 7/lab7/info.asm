INFO PROC
	MOV si, OFFSET leftxlabel	
INFLX:						; label left x
	MOV ax, 0
	MOV al, [si]
	CMP al, '$' 
	JE EXITINFLX
	
	PUSH si
	CALL getChar
	MOV cx, 180				; x	
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
INFRX:						; label right x
	MOV ax, 0
	MOV al, [si]
	CMP al, '$' 
	JE EXITINFRX
	
	PUSH si
	CALL getChar
	MOV cx, 170				; x	
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
	
	MOV si, OFFSET leftx	
LX:						; left x
	MOV ax, 0
	MOV al, [si]
	CMP al, '$' 
	JE EXITLX
	
	PUSH si
	CALL getChar
	MOV cx, 250				; x	
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
	JMP LX
EXITLX:	
	MOV posx, 0
	
	MOV si, OFFSET rightx		
RX:							; right x
	MOV ax, 0
	MOV al, [si]
	CMP al, '$' 
	JE EXITRX
	
	PUSH si
	CALL getChar
	MOV cx, 260				; x	
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
	JMP RX

EXITRX:	
	MOV posx, 0
	
	MOV si, OFFSET minxlabel	
INFMIX:						; label left x
	MOV ax, 0
	MOV al, [si]
	CMP al, '$' 
	JE EXITINFMIX
	
	PUSH si
	CALL getChar
	MOV cx, 190				; x	
	MOV dx, 31					; y
	ADD cx, posx
	ADD posx, 10
	PUSH es
	mov ax, 0A000h 				; сегментный адрес видеопамяти
	mov es, ax
	CALL WRITE8X8
	POP es
	POP si
	inc si
	JMP INFMIX
	
EXITINFMIX:	
	MOV posx, 0
	
		MOV si, OFFSET maxxlabel	
INFMAX:						; label left x
	MOV ax, 0
	MOV al, [si]
	CMP al, '$' 
	JE EXITINFMAX
	
	PUSH si
	CALL getChar
	MOV cx, 190				; x	
	MOV dx, 44					; y
	ADD cx, posx
	ADD posx, 10
	PUSH es
	mov ax, 0A000h 				; сегментный адрес видеопамяти
	mov es, ax
	CALL WRITE8X8
	POP es
	POP si
	inc si
	JMP INFMAX
	
EXITINFMAX:	
	MOV posx, 0
	
	MOV si, OFFSET maxys		
RXM:							; right x
	MOV ax, 0
	MOV al, [si]
	CMP al, '$' 
	JE EXITRXM
	
	PUSH si
	CALL getChar
	MOV cx, 260				; x	
	MOV dx, 44					; y
	ADD cx, posx
	ADD posx, 10
	PUSH es
	mov ax, 0A000h 				; сегментный адрес видеопамяти
	mov es, ax
	CALL WRITE8X8
	POP es
	POP si
	inc si
	JMP RXM

EXITRXM:	
	MOV posx, 0
	
	MOV si, OFFSET minys	
LXM:						; left x
	MOV ax, 0
	MOV al, [si]
	CMP al, '$' 
	JE EXITLXM
	
	PUSH si
	CALL getChar
	MOV cx, 250				; x	
	MOV dx, 31					; y
	ADD cx, posx
	ADD posx, 10
	PUSH es
	mov ax, 0A000h 				; сегментный адрес видеопамяти
	mov es, ax
	CALL WRITE8X8
	POP es
	POP si
	inc si
	JMP LXM
EXITLXM:	
	MOV posx, 0

	RET
INFO ENDP