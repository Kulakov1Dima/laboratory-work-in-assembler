screensaver PROC 
	; подсчёт дельты
	FINIT
	FLD numB
	FLD numA
	FSUB
	FIDIV numN
	FSTP QWORD PTR [delta]

	; подсчёт masx и masy отображение графика
FLD numA
	MOV cx, WORD PTR [numN]
	XOR di, di
TAKEMAS:
	FST QWORD PTR [mas[di]]
        FILD del

	CALL funk

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
	RET
screensaver ENDP