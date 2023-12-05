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
	
WHITEW PROC				 ; закрашивает окно белым

	MOV cx, 320*200			 ; колличество пикселей на экране
	MOV di, 0	
	WHITEWINDOW:	
		MOV al, 15  		;белый
		MOV es:[di], al
		INC di 	  		; следующий пиксель
		LOOP WHITEWINDOW
	RET
	WHITEW ENDP
