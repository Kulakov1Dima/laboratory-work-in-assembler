CODE SEGMENT 
.386
ASSUME cs:CODE, ds:CODE
org 100h
f10:
	JMP START
	hello_message db 'Resident module installed!', 10, 13,'$'
	Old_16h dd 0

NEW16h:
	CMP ah, 0
	JE resid
	
	CMP ah, 10h
	JNE exit
	
resid:
	PUSHF
	CALL cs:Old_16h				; Вызываем стандартный обработчик
	
	CMP ah, 85h
	JNE	exit
	
	PUSHA
	MOV ah, 02h
	MOV dl, 'F'
	INT 21h
	POPA
exit:
	IRET
	JMP cs:Old_16h				; Вызываем правильный системный обработчик.
	
START:
	MOV ah, 09h
	MOV dx, offset hello_message
	INT 21h
	
	MOV ah, 35h				;  Получаем вектор правильного (системного) обработчика (в ES:BX).
	MOV al, 16h
	INT 21h
	
	MOV  WORD PTR Old_16h, bx		;  Запоминаем вектор правильного (системного) обработчика.
	MOV  WORD PTR Old_16h+2, es
	
	MOV dx, OFFSET NEW16h
	MOV ah, 25h				;  Устанавливаем вектор своего обработчика.
	MOV al, 16h
	INT 21h
	
	MOV dx, OFFSET START
	INT 27h
   
CODE ENDS
END f10