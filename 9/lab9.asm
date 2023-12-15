.MODEL small
.STACK 100h
.386

.DATA
FileNameV db 'Screen.bin', 0
linebufV db 320 dup (0)

	
.CODE

MAIN PROC

	XOR ah, ah 			; установить графический видеорежим
	MOV al, 13h 			;  320x200
	INT 10h
	
	MOV ax, 0A000h 		; сегментный адрес видеопамяти
	MOV es, ax

	MOV cx, 320*200        ; Количество пикселей на экране
	MOV di, 0
ER_INF_WINDOW:
	MOV al, 4
	MOV es:[di], al
	INC di
	LOOP ER_INF_WINDOW


	MOV dx, OFFSET FileNameV
	MOV cx, 0
	MOV ah, 3Ch ; создать файл
	INT 21h
	
	PUSH es
	MOV di, 0
	MOV cx, 200
	
	MOV ax, 0A000h 		; сегментный адрес видеопамяти
	MOV es, ax

WRI:
	PUSH cx
	MOV cx, 320       ; Количество пикселей на экране
	MOV si, OFFSET linebufV
READ_WINDOW:
	MOV al, es:[di]
	MOV [si], al
	INC di
	INC si
	LOOP READ_WINDOW
	

	MOV dx, OFFSET linebufV
    	MOV cx, 320
    	MOV ah, 40h ; записать строку в файл
    	INT 21h

    	POP cx
    	LOOP WRI
    	
    	MOV ah, 3Eh ; закрыть файл
    	INT 21h
    	POP es
	
	MOV ah, 0				; ожидание нажатия клавиши
	INT 16h

    	
    	XOR ah, ah 			; восстановить видеорежим
	MOV al, 3
	INT 10h
    	
	MOV ah, 4Ch
	INT 21h
	

    MAIN ENDP
END MAIN