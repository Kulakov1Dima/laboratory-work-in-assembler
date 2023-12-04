.MODEL small
.STACK 100h
.386

.DATA
	;сегмент информации о графике
	rightxlabel db "right x: $" 
	leftxlabel db "left x: $"
	minxlabel db "min y: $" 
	maxxlabel db "max y: $"
	degree dd 10
	lenpoint dw 100			 	; 2 знака после запятой
	znak dd 1
	wholex dw 0
	pointx dw 0
	maxy dq 0.0
	miny dq 0.0
	rightx db 10 dup ('$')
	leftx db 10 dup ('$')	
	minys db 10 dup ('$')
	maxys db 10 dup ('$')	
	;сегмент переменных графика........................................................................................
	numA dq -20.2
							;начальное значение x конечное зависит от шага
	koefY dq 8.1
	koefX dq 7.8
	; k = 2
	numN dw 450				;колличество точек графика (не пикселей)
	delta dq 0.09				; шаг x
	del dd 5					
	mas dq 3600 dup (0.0)			;колличество точек *8
	masy dq 3600 dup (0.0)
	curent dd 0
	zeroX dd 160
	zeroY dd 100
	;сегмент переменных файла..........................................................................................
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
	;сегмент переменных графики........................................................................................
	sMode db 3
	pixela db 15,15,15,1,1,15,15,15,15,15,1,1,1,1,15,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,1,1,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,15,15,15,15,15,15,15
	pixelb db 15,1,1,1,1,1,15,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,1,1,1,15,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,1,1,1,15,15,15,15,15,15,15,15,15,15
	pixelc db 15,15,1,1,1,1,15,15,15,1,1,15,15,1,1,15,1,1,15,15,15,15,15,15,1,1,15,15,15,15,15,15,1,1,15,15,15,15,15,15,15,1,1,15,15,1,1,15,15,15,1,1,1,1,15,15,15,15,15,15,15,15,15,15
	pixeld db 15,1,1,1,1,15,15,15,15,1,1,15,1,1,15,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,1,1,15,15,15,1,1,1,1,15,15,15,15,15,15,15,15,15,15,15
	pixele db 15,1,1,1,1,1,1,15,15,1,1,15,15,15,15,15,15,1,1,15,15,15,15,15,15,1,1,1,1,15,15,15,15,1,1,15,15,15,15,15,15,1,1,15,15,15,15,15,15,1,1,1,1,1,1,15,15,15,15,15,15,15,15,15
	pixelf db 15,1,1,1,1,1,1,15,15,1,1,15,15,15,15,15,15,1,1,15,15,15,15,15,15,1,1,1,1,15,15,15,15,1,1,15,15,15,15,15,15,1,1,15,15,15,15,15,15,1,1,15,15,15,15,15,15,15,15,15,15,15,15,15
	pixelg db 15,15,15,15,15,15,15,15,15,1,1,15,15,1,1,15,1,1,15,15,15,15,15,15,1,1,15,15,15,15,15,15,1,1,15,15,1,1,1,15,15,1,1,15,15,1,1,15,15,15,1,1,1,1,1,15,15,15,15,15,15,15,15,15
	pixelh db 15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,1,1,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,15,15,15,15,15,15,15
	pixeli db 15,15,15,1,1,15,15,15,15,15,15,1,1,15,15,15,15,15,15,1,1,15,15,15,15,15,15,1,1,15,15,15,15,15,15,1,1,15,15,15,15,15,15,1,1,15,15,15,15,15,15,1,1,15,15,15,15,15,15,15,15,15,15,15
	pixelj db 15,15,15,15,15,1,1,15,15,15,15,15,15,1,1,15,15,15,15,15,15,1,1,15,15,15,15,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,15,1,1,1,1,15,15,15,15,15,15,15,15,15,15
	pixelk db 15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,1,1,15,15,15,1,1,1,1,15,15,15,15,1,1,15,1,1,15,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,15,15,15,15,15,15,15
	pixell db 15,1,1,15,15,15,15,15,15,1,1,15,15,15,15,15,15,1,1,15,15,15,15,15,15,1,1,15,15,15,15,15,15,1,1,15,15,15,15,15,15,1,1,15,15,15,15,15,15,1,1,1,1,1,1,15,15,15,15,15,15,15,15,15
	pixelm db 1,1,15,15,15,1,1,15,1,1,1,15,1,1,1,15,1,1,1,1,1,1,1,15,1,1,1,1,1,1,1,15,1,1,15,1,15,1,1,15,1,1,15,15,15,1,1,15,1,1,15,15,15,1,1,15,15,15,15,15,15,15,15,15
	pixeln db 1,1,15,15,15,1,1,15,1,1,1,15,15,1,1,15,1,1,1,1,15,1,1,15,1,1,15,1,1,1,1,15,1,1,15,15,1,1,1,15,1,1,15,15,15,1,1,15,1,1,15,15,15,1,1,15,15,15,15,15,15,15,15,15
	pixelo db 15,15,1,1,1,1,15,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,15,1,1,1,1,15,15,15,15,15,15,15,15,15,15
	pixelp db 15,1,1,1,1,1,15,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,1,1,1,15,15,15,1,1,15,15,15,15,15,15,1,1,15,15,15,15,15,15,1,1,15,15,15,15,15,15,15,15,15,15,15,15,15
	pixelq db 15,15,1,1,1,1,15,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,1,1,1,15,15,15,1,1,1,1,15,15,15,15,15,15,1,1,1,15,15,15,15,15,15,15,15,15
	pixelr db 15,1,1,1,1,1,15,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,1,1,1,15,15,15,1,1,15,1,1,15,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,15,15,15,15,15,15,15
	pixels db 15,15,1,1,1,1,15,15,15,1,1,15,15,1,1,15,15,1,1,1,15,15,15,15,15,15,1,1,1,15,15,15,15,15,15,15,1,1,1,15,15,1,1,15,15,1,1,15,15,15,1,1,1,1,15,15,15,15,15,15,15,15,15,15
	pixelt db 15,1,1,1,1,1,1,15,15,15,15,1,1,15,15,15,15,15,15,1,1,15,15,15,15,15,15,1,1,15,15,15,15,15,15,1,1,15,15,15,15,15,15,1,1,15,15,15,15,15,15,1,1,15,15,15,15,15,15,15,15,15,15,15
	pixelu db 15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,15,1,1,1,1,1,15,15,15,15,15,15,15,15,15
	pixelv db 15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,15,1,1,1,1,15,15,15,15,15,1,1,15,15,15,15,15,15,15,15,15,15,15
	pixelw db 1,1,15,15,15,1,1,15,1,1,15,15,15,1,1,15,1,1,15,15,15,1,1,15,1,1,15,1,15,1,1,15,1,1,1,1,1,1,1,15,1,1,1,15,1,1,1,15,1,1,15,15,15,1,1,15,15,15,15,15,15,15,15,15
	pixelx db 15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,15,1,1,1,1,15,15,15,15,15,1,1,15,15,15,15,15,1,1,1,1,15,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,15,15,15,15,15,15,15
	pixely db 15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,1,1,15,15,15,1,1,1,1,15,15,15,15,15,1,1,15,15,15,15,15,15,1,1,15,15,15,15,15,15,1,1,15,15,15,15,15,15,15,15,15,15,15
	pixelz db 1,1,1,1,1,1,1,15,15,15,15,15,15,1,1,15,15,15,15,15,1,1,15,15,15,15,15,1,1,15,15,15,15,15,1,1,15,15,15,15,15,1,1,15,15,15,15,15,1,1,1,1,1,1,1,15,15,15,15,15,15,15,15,15
		
	colon db 15,15,15,15,15,15,15,15,15,15,2,2,15,15,15,15,15,15,2,2,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,2,2,15,15,15,15,15,15,2,2,15,15,15,15,15,15,15,15,15,15,15,15
	qual db 15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,2,2,2,2,2,2,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,2,2,2,2,2,2,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15
	multiply db 15,15,15,15,15,15,15,15,15,2,2,15,15,2,2,15,15,15,2,2,2,2,15,15,2,2,2,2,2,2,2,2,15,15,2,2,2,2,15,15,15,2,2,15,15,2,2,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15
	plus db  15,15,15,2,2,15,15,15,15,15,15,2,2,15,15,15,15,15,15,2,2,15,15,15,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,15,15,15,2,2,15,15,15,15,15,15,2,2,15,15,15,15,15,15,2,2,15,15,15
	divide db 15,15,15,15,15,2,2,15,15,15,15,15,2,2,15,15,15,15,15,2,2,15,15,15,15,15,2,2,15,15,15,15,15,2,2,15,15,15,15,15,2,2,15,15,15,15,15,15,2,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15
	minus db 15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15
	bracket1 db 15,15,15,2,2,15,15,15,15,15,2,2,15,15,15,15,15,2,2,15,15,15,15,15,15,2,2,15,15,15,15,15,15,2,2,15,15,15,15,15,15,15,2,2,15,15,15,15,15,15,15,2,2,15,15,15,15,15,15,15,15,15,15,15
	bracket2 db 15,2,2,15,15,15,15,15,15,15,2,2,15,15,15,15,15,15,15,2,2,15,15,15,15,15,15,2,2,15,15,15,15,15,15,2,2,15,15,15,15,15,2,2,15,15,15,15,15,2,2,15,15,15,15,15,15,15,15,15,15,15,15,15
	space db 64 dup(15)
	ddec db 15,15,15,1,15,15,15,15,15,15,1,1,1,15,15,15,15,1,1,15,1,1,15,15,1,1,15,15,15,1,1,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15
	
	curpix db 64 dup(0)
	posx dw 0
	posy dw 0
	
	symbol_buffer db 64 dup (0)
	revers_buffer db 64 dup (0)

.CODE

include labs/5/gD.asm 			; подготовка файла
include labs/7/rf.asm 			; чтение файла
include labs/7/gc.asm 			; получение символа для отрисовки
include labs/7/video.asm 			; операции с видеорежимом
include labs/7/matrix.asm 			; получение матриц
include labs/7/lab3v2.0/grid.asm 	; сетка
include labs/7/lab3v2.0/field.asm 	; поля
include labs/7/lab3v2.0/lab3.asm 	; график
include labs/7/lab7/info.asm 		; вывод информации о графике
include labs/7/lab7/drawPix.asm		; вывод матриц 8x8
include labs/7/lab7/tostr.asm		; перевод числа в строку
include labs/7/lab7/find.asm		; поиск экстремумов

		
MAIN PROC
	MOV ax,@DATA
	MOV ds,ax
	MOV es, ax 
	
	CALL getDescriptor
	CALL readFile
	
	CALL SAVEVIDMODE
	
	PUSH es
	mov ax, 0A000h 				; сегментный адрес видеопамяти
	mov es, ax
	
	CALL WHITEW
	CALL LAB3	
	POP es
	CALL FINDEXT
	CALL floattostr
	CALL INFO		 
	
	;FLD qword ptr maxy
	;FLD qword ptr miny
							; код для рисования
	MOV di, OFFSET [TextPlace]
	MOV cx, lenText
	ADD cx, -2				
	drawText:
		MOV al, [di]
		PUSH ax
		PUSH di
		PUSH cx		
		
		CALL getChar
		
		MOV cx, 10				; x	
		MOV dx, 175			; y
				
		ADD cx, posx
		ADD posx, 10
		ADD dx, posy
		
		PUSH es
		mov ax, 0A000h 			; сегментный адрес видеопамяти
		mov es, ax
		CALL WRITE8X8
		POP es
		POP cx
		POP di
		POP ax
		INC di
		CMP al, ':'
		JNE nextdraw
		ADD posy, 10
		ADD posx, 100
		nextdraw:
		LOOP drawText	
	
	CALL RETURNVIDMODE	
			          		
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





; Кулаков Д.А