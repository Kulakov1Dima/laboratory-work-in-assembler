.MODEL small
.STACK 100h
.386

.DATA
	sMode db 3
	curent dd 0
	degree dd 1
	deg dd 10
	zeroX dd 320
	zeroY dd 240
	koefX  dq 2.0
	numN dd 100
	numA dq -320.0
	numB dq 320.0
	delta dq 0.0
	del dd 5
	mas dq 640 dup (?)
	masy dq 640 dup (?)
.CODE

MAIN PROC
     MOV ax,@DATA
	MOV ds,ax

	FINIT
		
	FLD numB
	FLD numA
	FSUB
	FIDIV numN
	FSTP QWORD PTR [delta]

	MOV ah, 0Fh ; сохранить видеорежим
	INT 10h ; видео сервис
	MOV sMode, al
	
	XOR ah, ah ; установить графический видеорежим
	MOV al, 12h ;  640х480
	INT 10h
			
	FLD numA
	MOV cx, WORD PTR [numN]
	XOR di, di
TAKEMAS:
	FST QWORD PTR [mas[di]]
	fmul koefX

	FSIN
	FLD ST(0)
	FMUL ST(0), ST(0)
	FMUL ST(0), ST(1)
	FFREE ST(1)
	FMUL mas[di]
	FIDIV del

	FSTP QWORD PTR [masy[di]]
	PUSH cx
	
	FLD mas[di]
	FILD zeroX
	FADD
	frndint
	FISTP curent
	
	MOV ah, 0Ch ; пиксель
	MOV al, 7
	MOV cx, WORD PTR[curent]
	
	FLD masy[di]
	FILD zeroY
	FADD
	frndint
	FISTP curent

	MOV dx, WORD PTR[curent]
	int 10h
	
	POP cx
		
	FLD mas[di]
	FLD delta
	FADD
	INC di
	LOOP TAKEMAS
    	
	FFREE ST(0)

	mov ah, 0; ожидание нажатия клавиши
	int 16h
	
	xor ah, ah ; восстановить видеорежим
	mov al, sMode 
	int 10h
	
	MOV ah, 4Ch
	INT 21h
MAIN ENDP
END MAIN
