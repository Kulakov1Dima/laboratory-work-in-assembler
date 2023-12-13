CODE SEGMENT
.386
ASSUME cs:CODE, ds:CODE
org 100h

f10:
	JMP START
	hello_message db 'Resident module installed! Press f11 to take pictures :)', 10, 13, '$'
	FileNumber dw ?
	filename db 64 dup('b')
	Old_16h dd 0
	sMode db 0

	symbol_buffer db 64 dup (0)
	revers_buffer db 64 dup (0)
	
	include labs/8/snip.asm
	include labs/8/video.asm
	include labs/8/matrix.asm
	include labs/8/pixFont.asm

NEW16h:
	CMP ah, 0
	JE resid

	CMP ah, 10h
	JNE exit

resid:
	PUSHF
	CALL DWORD PTR cs:Old_16h ; Вызываем стандартный обработчик

	CMP ah, 85h
	JNE exit

	PUSHA
	
	mov cx, 64
	lea di, filename
	mov al, 'A'
	cld              
	rep stosb       
		
	CALL SNIP_TOOL
	
		
	mov cx, 6
	mov bx, offset filename
m1:  mov ah, 0eh
	mov al, cs:[bx]
	;int 10h
	inc bx
	loop m1
		
	MOV [FileNumber], ax
	POPA
exit:
	JMP cs:Old_16h ; Вызываем правильный системный обработчик.

START:
	MOV ah, 09h
	MOV dx, OFFSET hello_message
	INT 21h

	MOV ah, 35h ; Получаем вектор правильного (системного) обработчика (в ES:BX).
	MOV al, 16h
	INT 21h

	MOV WORD PTR Old_16h, bx ; Запоминаем вектор правильного (системного) обработчика.
	MOV WORD PTR Old_16h + 2, es

	MOV dx, OFFSET NEW16h
	MOV ah, 25h ; Устанавливаем вектор своего обработчика.
	MOV al, 16h
	INT 21h

	MOV dx, OFFSET START
	INT 27h

	MOV ah, 4Ch
	INT 21h

CODE ENDS
END f10
