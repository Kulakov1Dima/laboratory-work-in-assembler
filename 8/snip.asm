SNIP_TOOL PROC	
	MOV ah, 0Fh      ; Получить текущий видеорежим
    	INT 10h
    	CMP al, 13h
    	JNE not_13h   
    	
    	CALL VIDEO_SCREEN  
	CALL SAVEVIDMODE
	CALL INFO	
	CALL RETURNVIDMODE
	JMP snip_end
not_13h:
	CALL TEXT_SCREEN
	CALL SAVEVIDMODE
	CALL ERROR_INFO	   
	CALL RETURNVIDMODE
snip_end:
	
	RET
SNIP_TOOL ENDP


TEXT_SCREEN PROC
	MOV dx, OFFSET FileName
	MOV cx, 0
	MOV ah, 3Ch ; создать файл
	INT 21h
	JC  errorFile
	
	MOV bx, ax
	MOV cx, 25  ; 25 строк экрана
	MOV si, 0   ; начало экрана
	CLD
	
WRITE_LINE:   
	PUSH cx
	MOV  di, OFFSET linebuf
    	MOV ax, 0B800h
	MOV ds, ax
	MOV ax, cs
    	MOV es, ax
	MOV cx, 80 ; длина строки в символах
COPY_LINE:   
	MOVSB
	INC si
	LOOP COPY_LINE
	
    	MOV ax, cs
    	MOV ds, ax
   	MOV dx, OFFSET linebuf
    	MOV cx, 82
    	MOV ah, 40h ; записать строку в файл
    	INT 21h
    	
    	POP cx
    	loop WRITE_LINE
    	
    	MOV ah, 3Eh ; закрыть файл
    	INT 21h
    	
errorFile:   
	RET
TEXT_SCREEN ENDP

VIDEO_SCREEN PROC
	MOV dx, OFFSET FileNameV
	MOV cx, 0
	MOV ah, 3Ch ; создать файл
	INT 21h
	JC  errorFileV
	
	MOV bx, ax
	MOV cx, 200  ; для 13 режима
	MOV si, 0   ; начало экрана
	CLD
	
WRITE_VIDEO_LINE:	
	PUSH cx
	MOV  di, OFFSET linebufV
	MOV ax, 0A000h 		; сегментный адрес видеопамяти
	MOV ds, ax
	MOV ax, cs
    	MOV es, ax
    	MOV cx, 320
    	
COPY_VIDEO_LINE:   
	MOVSB
	INC si
	LOOP COPY_VIDEO_LINE
	
	MOV ax, cs
    	MOV ds, ax 	
   	MOV dx, OFFSET linebufV
    	MOV cx, 320
    	MOV ah, 40h ; записать строку в файл
    	INT 21h
    	
	POP cx
    	loop WRITE_VIDEO_LINE
    	
    	MOV ah, 3Eh ; закрыть файл
    	INT 21h
errorFileV:
	RET
VIDEO_SCREEN ENDP