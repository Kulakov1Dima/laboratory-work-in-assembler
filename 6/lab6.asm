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
	FileName db "/labs/6/Kulakov.txt", 0
	FileNumber dw ?
	TextLine db "Kulakov Dmitriy 6303: Y = (x* sin^3 x)/5", 13, 10
	TextError db 10, "ERROR!$"
	TextPlace db 40 DUP (?), '$'
	lenText dw 42
	pixela db 0,0,0,14,14,0,0,0,0,0,14,14,14,14,0,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,14,14,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,0,0,0,0,0,0,0
	pixelb db 0,14,14,14,14,14,0,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,14,14,14,0,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,14,14,14,0,0,0,0,0,0,0,0,0,0
	pixelc db 0,0,14,14,14,14,0,0,0,14,14,0,0,14,14,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,0,14,14,0,0,14,14,0,0,0,14,14,14,14,0,0,0,0,0,0,0,0,0,0
	pixeld db 0,14,14,14,14,0,0,0,0,14,14,0,14,14,0,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,14,14,0,0,0,14,14,14,14,0,0,0,0,0,0,0,0,0,0,0
	pixele db 0,14,14,14,14,14,14,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,14,14,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,14,14,14,14,0,0,0,0,0,0,0,0,0
	pixelf db 0,14,14,14,14,14,14,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,14,14,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,0,0,0,0,0,0,0
	pixelg db 0,0,14,14,14,14,0,0,0,14,14,0,0,14,14,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,14,14,14,0,0,14,14,0,0,14,14,0,0,0,14,14,14,14,14,0,0,0,0,0,0,0,0,0
	pixelh db 0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,14,14,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,0,0,0,0,0,0,0
	pixeli db 0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,0,0,0,0,0
	pixelj db 0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,0,14,14,14,14,0,0,0,0,0,0,0,0,0,0
	pixelk db 0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,14,14,0,0,0,14,14,14,14,0,0,0,0,14,14,0,14,14,0,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,0,0,0,0,0,0,0
	pixell db 0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,14,14,14,14,0,0,0,0,0,0,0,0,0
	pixelm db 14,14,0,0,0,14,14,0,14,14,14,0,14,14,14,0,14,14,14,14,14,14,14,0,14,14,14,14,14,14,14,0,14,14,0,14,0,14,14,0,14,14,0,0,0,14,14,0,14,14,0,0,0,14,14,0,0,0,0,0,0,0,0,0
	pixeln db 14,14,0,0,0,14,14,0,14,14,14,0,0,14,14,0,14,14,14,14,0,14,14,0,14,14,0,14,14,14,14,0,14,14,0,0,14,14,14,0,14,14,0,0,0,14,14,0,14,14,0,0,0,14,14,0,0,0,0,0,0,0,0,0
	pixelo db 0,0,14,14,14,14,0,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,0,14,14,14,14,0,0,0,0,0,0,0,0,0,0
	pixelp db 0,14,14,14,14,14,0,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,14,14,14,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,0,0,0,0,0,0,0
	pixelq db 0,0,14,14,14,14,0,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,14,14,14,0,0,0,14,14,14,14,0,0,0,0,0,0,14,14,14,0,0,0,0,0,0,0,0,0
	pixelr db 0,14,14,14,14,14,0,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,14,14,14,0,0,0,14,14,0,14,14,0,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,0,0,0,0,0,0,0
	pixels db 0,0,14,14,14,14,0,0,0,14,14,0,0,14,14,0,0,14,14,14,0,0,0,0,0,0,14,14,14,0,0,0,0,0,0,0,14,14,14,0,0,14,14,0,0,14,14,0,0,0,14,14,14,14,0,0,0,0,0,0,0,0,0,0
	pixelt db 0,14,14,14,14,14,14,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,0,0,0,0,0
	pixelu db 0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,0,14,14,14,14,14,0,0,0,0,0,0,0,0,0
	pixelv db 0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,0,14,14,14,14,0,0,0,0,0,14,14,0,0,0,0,0,0,0,0,0,0,0
	pixelw db 14,14,0,0,0,14,14,0,14,14,0,0,0,14,14,0,14,14,0,0,0,14,14,0,14,14,0,14,0,14,14,0,14,14,14,14,14,14,14,0,14,14,14,0,14,14,14,0,14,14,0,0,0,14,14,0,0,0,0,0,0,0,0,0
	pixelx db 0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,0,14,14,14,14,0,0,0,0,0,14,14,0,0,0,0,0,14,14,14,14,0,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,0,0,0,0,0,0,0
	pixely db 0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,0,14,14,14,14,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,0,0,0,0,0
	pixelz db 14,14,14,14,14,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,14,14,0,0,0,0,0,14,14,0,0,0,0,0,14,14,0,0,0,0,0,14,14,0,0,0,0,0,14,14,14,14,14,14,14,0,0,0,0,0,0,0,0,0
	
	pixel0 db 0,14,14,14,14,14,0,0,14,14,0,0,0,14,14,0,14,14,0,0,14,14,14,0,14,14,0,14,14,14,14,0,14,14,14,14,0,14,14,0,14,14,14,0,0,14,14,0,0,14,14,14,14,14,0,0,0,0,0,0,0,0,0,0
	pixel1 db 0,0,14,14,0,0,0,0,0,14,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,0,0,0,0,0,0
	pixel2 db 0,14,14,14,14,0,0,0,14,14,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,14,14,14,0,0,0,0,14,14,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,14,14,14,14,0,0,0,0,0,0,0,0,0,0
	pixel3 db 0,14,14,14,14,0,0,0,14,14,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,14,14,14,0,0,0,0,0,0,0,14,14,0,0,14,14,0,0,14,14,0,0,0,14,14,14,14,0,0,0,0,0,0,0,0,0,0,0
	pixel4 db 0,0,0,14,14,14,0,0,0,0,14,14,14,14,0,0,0,14,14,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,14,14,14,14,14,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,0,0,0,0
	pixel5 db 14,14,14,14,14,14,0,0,14,14,0,0,0,0,0,0,14,14,14,14,14,0,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,14,14,0,0,14,14,0,0,0,14,14,14,14,0,0,0,0,0,0,0,0,0,0,0
	pixel6 db 0,0,14,14,14,0,0,0,0,14,14,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,14,14,14,0,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,0,14,14,14,14,0,0,0,0,0,0,0,0,0,0,0
	pixel7 db 14,14,14,14,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,14,14,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,0,0,0,0,0,0
	pixel8 db 0,14,14,14,14,0,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,0,14,14,14,14,0,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,0,14,14,14,14,0,0,0,0,0,0,0,0,0,0,0
	pixel9 db 0,14,14,14,14,0,0,0,14,14,0,0,14,14,0,0,14,14,0,0,14,14,0,0,0,14,14,14,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,14,14,0,0,0,0,14,14,14,0,0,0,0,0,0,0,0,0,0,0,0
	
	colon db 0,0,0,0,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,0,0,0,0,0,0
	qual db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,14,14,14,14,14,14,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,14,14,14,14,14,14,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	multiply db 0,0,0,0,0,0,0,0,0,14,14,0,0,14,14,0,0,0,14,14,14,14,0,0,14,14,14,14,14,14,14,14,0,0,14,14,14,14,0,0,0,14,14,0,0,14,14,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	plus db  0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0
	divide db 0,0,0,0,0,14,14,0,0,0,0,0,14,14,0,0,0,0,0,14,14,0,0,0,0,0,14,14,0,0,0,0,0,14,14,0,0,0,0,0,14,14,0,0,0,0,0,0,14,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	minus db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	bracket1 db 0,0,0,14,14,0,0,0,0,0,14,14,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,0,14,14,0,0,0,0,0,0,0,14,14,0,0,0,0,0,0,0,0,0,0,0
	bracket2 db 0,14,14,0,0,0,0,0,0,0,14,14,0,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,0,14,14,0,0,0,0,0,14,14,0,0,0,0,0,14,14,0,0,0,0,0,0,0,0,0,0,0,0,0
	space db 64 dup(0)
	ddec db 0,0,0,14,0,0,0,0,0,0,14,14,14,0,0,0,0,14,14,0,14,14,0,0,14,14,0,0,0,14,14,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	
	curpix db 64 dup(0)
	pos dw 0
	
	.CODE
	include labs/2/f.asm ; функция из 2 лабораторной работы
	include labs/5/ss.asm ; заставка
	include labs/5/gD.asm ; подготовка файла
	include labs/6/rf.asm ; чтение файла
	include labs/6/gc.asm ; получение символа для отрисовки
	
MAIN PROC
     MOV ax,@DATA
	MOV ds,ax
	MOV es, ax 

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
	CALL readFile
	
	XOR ah, ah ; установить графический видеорежим
	MOV al, 12h ;  640х480
	INT 10h

	MOV di, OFFSET [TextPlace]
	MOV cx, lenText
	ADD cx, -2
drawText:
	MOV al, [di]
	PUSH di
	PUSH cx
		
	CALL getChar
	
	ADD pos, 10
			
	MOV cx, 100
	ADD cx, pos
	MOV dx, 160
	
     MOV si, 0
     MOV bx, 0
     PUSH dx
loopy:
	MOV di, 0
	loopx:
		PUSH cx
		ADD cx, di
		MOV ah, 0Ch ; пиксель
		INC bx
		MOV al, curpix[bx]
		int 10h
		POP cx
		INC di
		CMP di, 8
		JNE loopx
	INC si
	INC dx
	CMP si, 8
	JNE loopy
	POP dx
	POP cx
	POP di
	INC di
	loop drawText
		
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
