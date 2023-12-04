; третья лабораторная работа для 13 (320x200) видеорежима с исправленным масштабированием

LAB3 PROC
	CALL CREATE_GRID			; вызов функции сетки и координатных прямых
	
	FINIT
	FLD numA 
	
	MOV cx, WORD PTR [numN]
	XOR di, di
	
TAKEMAS:
	FST QWORD PTR [mas[di]]
	
	FSIN
	FLD ST(0)
	FMUL ST(0), ST(0)
	FMUL ST(0), ST(1)
	FFREE ST(1)
	FMUL mas[di]
	FIDIV del
	
	FSTP QWORD PTR [masy[di]]
	
	FLD mas[di]
	FLD delta
	FADD
	ADD di, 8
	LOOP TAKEMAS
	
	FSTP QWORD PTR [mas[di]]

		
	mov ax, 0A000h 				; сегментный адрес видеопамяти для 13 режима
	mov es, ax

	MOV cx, WORD PTR [numN]
	XOR di, di
	
TAKEVIDMAS:
	PUSH cx
	FLD mas[di]
	FMUL koefX
	FILD zeroX
	FADD
	FISTP curent
	MOV cx, WORD PTR[curent] 		; x
	FILD zeroy
	FLD masy[di]
	FMUL koefY
	FSUB
	frndint
	FISTP curent
	MOV dx, WORD PTR[curent] 		; y

	PUSH di
	MOV di, 0
	ADD di, cx
	MOV ax, 320
	MUL dx
	ADD di, ax
	
	
	MOV al, 4
	MOV es:[di], al	

	
	POP di
	POP cx
	ADD di, 8
	LOOP TAKEVIDMAS

	CALL CREATE_FIELD			; закрашивание места под информацию (label)
	RET
LAB3 ENDP