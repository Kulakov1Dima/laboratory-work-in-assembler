.MODEL small
.STACK 100h
.386

.DATA
	sMode db 3
	numN dd 100
	numA dq -320.0
	numB dq 320.0
	delta dq 0.0
	curent dd 0
	zeroX dd 320
	zeroY dd 240
	koefX  dq 2.0
	del dd 5
	mas dq 640 dup (?)
	masy dq 640 dup (?)
	message1 db "opening a file...$"
	message2 db 10, "file not found$"
	message5 db 10, "access denied$"
	addmessage1 db 10, "create a file? Y/N $"
	addAccess db 2, 3 dup(?)
	FileName db "/labs/5/Kulakov.txt", 0

.CODE

	include labs/2/f.asm ; функция из 2 лабораторной работы
	include labs/5/ss.asm ; заставка
	
MAIN PROC
     MOV ax,@DATA
	MOV ds,ax
	
	MOV ah, 0Fh ; сохранить видеорежим
	INT 10h ; видео сервис
	MOV sMode, al

	XOR ah, ah ; установить графический видеорежим
	MOV al, 12h ;  640х480
	INT 10h

	CALL screensaver
		
	MOV ah, 0; ожидание нажатия клавиши
	INT 16h
	
	XOR ah, ah ; восстановить видеорежим
	MOV al, sMode 
	INT 10h
			
open:	
	MOV ah, 09h
	MOV dx, OFFSET message1
	INT 21h

	; Открытие файла для чтения
	mov ah, 3Dh
	mov al, 0
	mov dx, OFFSET FileName
	int 21h    
	JNB next1	
	;ошибки
	CMP ax, 02h
	JE noFile
	CMP ax, 05h
	JE noAccess
	JNE next1
	
noFile:
	MOV ah, 09h
	MOV dx, OFFSET message2
	INT 21h
	JMP addFile
noAccess:
	MOV ah, 09h
	MOV dx, OFFSET message5
	INT 21h
	JMP next1
addFile:
	MOV ah, 09h
	MOV dx, OFFSET addmessage1
	INT 21h
	
	MOV ah, 0Ah
	MOV dx, OFFSET addAccess
	INT 21h
	
	MOV si, OFFSET [addAccess+2]
	MOV dl, [si]
	CMP dl, 'Y'
	JNE next1
	;создаём файл
	MOV [addAccess+1], 0
	mov ah, 3Ch
	mov cx, 0
	mov dx, offset FileName
	int 21h

next1:

	MOV ah, 4Ch
	INT 21h
MAIN ENDP
END MAIN
