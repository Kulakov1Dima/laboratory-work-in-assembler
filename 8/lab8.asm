.MODEL SMALL
.386
.CODE
ORG 100h

MAIN: 	JMP START
	;файл текст
	FileName db 'Out.txt', 0
	linebuf db 80 dup (0), 13, 10
	;файл видео
	
	FileNameV db 'Screen.txt', 0
	linebufV db 320 dup (0)
	
	;старое прерывание
	Old_16h dd 0
	
	;видео
	sMode db 0
	symbol_buffer db 64 dup (0)
	revers_buffer db 64 dup (0)
	
	include labs/8/snip.asm
	include labs/8/video.asm
	include labs/8/matrix.asm
	include labs/8/pixFont.asm

NEW16h:
	PUSH ds
	PUSH es
		
	push cs
    	pop  ds
    	
    	PUSHF
	CALL DWORD PTR Old_16h ; Вызываем стандартный обработчик
	
	PUSHA 
	PUSH es
	in al, 60h
     	cmp al, 19h            ; нажата p?
     	POP es
     	POPA
	jne exit
	PUSHA  
	PUSH es
	mov ax, 40h
	mov es, ax
	mov al, es:[17h]
	and al, 1000b         ; нажата ALT?
	POP es
	POPA
	jz exit
	
	PUSHA
	CALL SNIP_TOOL
	POPA

exit:
	POP es
	POP ds
	JMP Old_16h ; Вызываем правильный системный обработчик.
	 
rsize   db 0

hello_message db 'Resident module installed! Press alt+p to take pictures :)', 10, 13, '$'

START:
	PUSH cs
	POP ds
	
	MOV ah, 09h
	MOV dx, OFFSET hello_message
	INT 21h
		
	MOV ah, 35h ; Получаем вектор правильного (системного) обработчика (в ES:BX).
	MOV al, 16h
	INT 21h
	
	MOV WORD PTR Old_16h, bx ; Запоминаем вектор правильного (системного) обработчика.
	MOV WORD PTR Old_16h + 2, es
	
	cmp bx,offset NEW16h
	JZ  ALREADY

	MOV dx, OFFSET NEW16h
	MOV ah, 25h ; Устанавливаем вектор своего обработчика.
	INT 21h

	MOV  dx, OFFSET rsize ; адрес длины резидента
	MOV  cl,4
	SHR  dx,cl ; dx=dx/16+1 ; размер резидента в параграфах
	INC  dx
	
	MOV  ax, 3100h ; остаться резидентом
	INT  21h
	
ALREADY:
	MOV ah, 4Ch
	INT 21h
	
END MAIN


