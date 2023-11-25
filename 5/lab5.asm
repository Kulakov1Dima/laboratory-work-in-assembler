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
	message3 db 10, "path not found$"
	message4 db 10, "too many files are open$"
	message5 db 10, "access denied$"
	addmessage1 db 10, "create a file? Y/N $"
	addAccess db 2, 3 dup(?)
	FileName db "/labs/5/Kulakov.txt", 0
	FileNumber dw ?
	TextLine db "Kulakov Dmitriy 6303: Y = (x* sin^3 x)/5", 13, 10
	TextError db 10, "ERROR!$"
	TextPlace db 40 DUP (?), '$'
	lenText dw 42

.CODE

	include labs/2/f.asm ; функция из 2 лабораторной работы
	include labs/5/ss.asm ; заставка
	include labs/5/gD.asm ; подготовка файла
	
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
	
	CALL getDescriptor
	
	; чтение файла
	MOV ah, 03Fh
	MOV bx, [FileNumber]
	MOV cx, 40
	MOV dx, offset TextPlace
	INT 21h
	JC readerr
	
	; Вывод прочитанных байт на экран
	;MOV dx, OFFSET TextPlace
	;MOV ah, 9
	;INT 21h
	
	mov ax, 0003h ; видеорежим 3 (очистка экрана)
	int 10h
	
	mov cx, lenText
	add cx, -2
	mov di, 160*10 + 40
	mov ax, 0B800h ; сегментный адрес видеопамяти
	mov es, ax
	MOV si, OFFSET TextPlace
	
drawText:
	mov ah, 3h
	mov al, [si]
	cmp al, ' '
	je skipSpace

	mov word ptr es:[di], ax
	add di, 2

skipSpace:
	inc si
	loop drawText
		
	; Закрытие файла
	MOV bx, [FileNumber]
	MOV ah, 03Eh
	INT 21h
	
	MOV ah, 0; ожидание нажатия клавиши
	INT 16h
	
	XOR ah, ah ; восстановить видеорежим
	MOV al, sMode 
	INT 10h

	JMP next2
readerr:
	MOV dx, OFFSET TextError
	MOV ah, 9
	INT 21h
next2:			
	MOV ah, 4Ch
	INT 21h
MAIN ENDP
END MAIN