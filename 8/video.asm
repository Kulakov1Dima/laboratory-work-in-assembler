; работа с видеорежимом

SAVEVIDMODE PROC

	MOV ah, 0Fh 			; сохранить видеорежим
	INT 10h
	MOV sMode, al
	
	XOR ah, ah 			; установить графический видеорежим
	MOV al, 13h 			;  320x200
	INT 10h
	
	RET
	SAVEVIDMODE ENDP
	
RETURNVIDMODE PROC

	MOV ah, 0				; ожидание нажатия клавиши
	INT 16h
	
	XOR ah, ah 			; восстановить видеорежим
	MOV al, 3
	INT 10h

	RET
	RETURNVIDMODE ENDP
	
		
ERROR_INFO PROC
	PUSH es
	MOV ax, 0A000h 			; сегментный адрес видеопамяти
	MOV es, ax

    	MOV cx, 320*200        	; Количество пикселей на экране
    	MOV di, 0
INF_WINDOW:
    	MOV al, 4
    	MOV es:[di], al
    	INC di
    	LOOP INF_WINDOW
    	
    	
    	MOV cx, 300
	MOV di, 10
DRAW_TOP_BOTTOM:
	MOV al, 15
	MOV es:[di+ 320*10], al
	MOV es:[di + 320*189], al
	INC di
	LOOP DRAW_TOP_BOTTOM
	
	MOV cx, 180        
	MOV di, 320*10
DRAW_LEFT_RIGHT:
	MOV al, 15              
	MOV es:[di+10], al
	MOV es:[di+310], al
	ADD di, 320
	LOOP DRAW_LEFT_RIGHT
    	POP es
    	
	RET
ERROR_INFO ENDP