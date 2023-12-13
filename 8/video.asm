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
	MOV al, sMode
	INT 10h

	RET
	RETURNVIDMODE ENDP
	
		
ERROR_INFO PROC
	PUSH es
	MOV ax, 0A000h 		; сегментный адрес видеопамяти
	MOV es, ax

	MOV cx, 320*200        ; Количество пикселей на экране
	MOV di, 0
ER_INF_WINDOW:
	MOV al, 4
	MOV es:[di], al
	INC di
	LOOP ER_INF_WINDOW
    
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
    	
    	MOV di, "P"
    	CALL matrix
    	MOV cx, 85
	MOV dx, 100
	CALL WRITE8X8
	MOV di, "R"
    	CALL matrix
    	MOV cx, 95
	MOV dx, 100
	CALL WRITE8X8
	MOV di, "E"
    	CALL matrix
    	MOV cx, 105
	MOV dx, 100
	CALL WRITE8X8
	MOV di, "S"
    	CALL matrix
    	MOV cx, 115
	MOV dx, 100
	CALL WRITE8X8
	MOV di, "S"
    	CALL matrix
    	MOV cx, 125
	MOV dx, 100
	CALL WRITE8X8
	MOV di, "A"
    	CALL matrix
    	MOV cx, 145
	MOV dx, 100
	CALL WRITE8X8
	MOV di, "N"
    	CALL matrix
    	MOV cx, 155
	MOV dx, 100
	CALL WRITE8X8
	MOV di, "Y"
    	CALL matrix
    	MOV cx, 165
	MOV dx, 100
	CALL WRITE8X8
	CALL WRITE8X8
	MOV di, "B"
    	CALL matrix
    	MOV cx, 185
	MOV dx, 100
	CALL WRITE8X8
	MOV di, "U"
    	CALL matrix
    	MOV cx, 195
	MOV dx, 100
	CALL WRITE8X8
	MOV di, "T"
    	CALL matrix
    	MOV cx, 205
	MOV dx, 100
	CALL WRITE8X8
	MOV di, "T"
    	CALL matrix
    	MOV cx, 215
	MOV dx, 100
	CALL WRITE8X8
	MOV di, "O"
    	CALL matrix
    	MOV cx, 225
	MOV dx, 100
	CALL WRITE8X8
	MOV di, "N"
    	CALL matrix
    	MOV cx, 235
	MOV dx, 100
	CALL WRITE8X8
	POP es
	RET
ERROR_INFO ENDP


INFO PROC
	PUSH es
	MOV ax, 0A000h 		; сегментный адрес видеопамяти
	MOV es, ax

	MOV cx, 320*200        ; Количество пикселей на экране
	MOV di, 0
INF_WINDOW:
	MOV al, 1
	MOV es:[di], al
	INC di
	LOOP INF_WINDOW
    
	MOV cx, 300
	MOV di, 10
DRAW_TOP_BOTTOM1:
	MOV al, 15
	MOV es:[di+ 320*10], al
	MOV es:[di + 320*189], al
	INC di
	LOOP DRAW_TOP_BOTTOM1
    
	MOV cx, 180        
	MOV di, 320*10
DRAW_LEFT_RIGHT1:
	MOV al, 15              
	MOV es:[di+10], al
	MOV es:[di+310], al
	ADD di, 320
	LOOP DRAW_LEFT_RIGHT1
    	
    	MOV di, "P"
    	CALL matrix
    	MOV cx, 85
	MOV dx, 100
	CALL WRITE8X8
	MOV di, "R"
    	CALL matrix
    	MOV cx, 95
	MOV dx, 100
	CALL WRITE8X8
	MOV di, "E"
    	CALL matrix
    	MOV cx, 105
	MOV dx, 100
	CALL WRITE8X8
	MOV di, "S"
    	CALL matrix
    	MOV cx, 115
	MOV dx, 100
	CALL WRITE8X8
	MOV di, "S"
    	CALL matrix
    	MOV cx, 125
	MOV dx, 100
	CALL WRITE8X8
	MOV di, "A"
    	CALL matrix
    	MOV cx, 145
	MOV dx, 100
	CALL WRITE8X8
	MOV di, "N"
    	CALL matrix
    	MOV cx, 155
	MOV dx, 100
	CALL WRITE8X8
	MOV di, "Y"
    	CALL matrix
    	MOV cx, 165
	MOV dx, 100
	CALL WRITE8X8
	CALL WRITE8X8
	MOV di, "B"
    	CALL matrix
    	MOV cx, 185
	MOV dx, 100
	CALL WRITE8X8
	MOV di, "U"
    	CALL matrix
    	MOV cx, 195
	MOV dx, 100
	CALL WRITE8X8
	MOV di, "T"
    	CALL matrix
    	MOV cx, 205
	MOV dx, 100
	CALL WRITE8X8
	MOV di, "T"
    	CALL matrix
    	MOV cx, 215
	MOV dx, 100
	CALL WRITE8X8
	MOV di, "O"
    	CALL matrix
    	MOV cx, 225
	MOV dx, 100
	CALL WRITE8X8
	MOV di, "N"
    	CALL matrix
    	MOV cx, 235
	MOV dx, 100
	CALL WRITE8X8
	POP es
	RET
INFO ENDP
