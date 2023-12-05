CONVERTERSTR PROC
	MOV cx, 0
converter:
	xor dx,dx
	MOV bx, 10            
	DIV bx
	PUSH dx
	INC cx
	TEST ax,ax
	JNZ converter

getstr:
	POP dx
	ADD dl, '0'
	MOV [di], dl
	INC di
	loop getstr
RET
CONVERTERSTR ENDP

floattostr PROC
	FINIT
	; получение дробной части
	
	MOV znak, 1
	; получение дробной части
	FLD1
	FLD QWORD PTR mas[0]			; левая граница функции для дробной части
	FPREM
	FSTP
	FLDZ
	FCOM
	FSTP st(0)	
	FSTSW AX           
	SAHF
	JAE less_than_zero
	JMP done_comparison
less_than_zero:
	FCHS
	MOV znak, -1
done_comparison:
	FIMUL lenpoint
	FRNDINT
	FISTP WORD PTR pointx
	
	; получение целой части
	FLD1
	FLD QWORD PTR mas[0]			; левая граница функции для дробной части
	FPREM
	FSTP
	FLD QWORD PTR mas[0]			; левая граница функции для целой части
	FXCH
	FSUB
	FRNDINT
	FIMUL znak
	FISTP WORD PTR wholex
	
	MOV di, OFFSET leftx
	MOV ax, wholex
	
	CMP znak, 0
	JNL takeznak
	MOV dl, '-'
	MOV [di], dl
	INC di
takeznak:	
	
	CALL CONVERTERSTR				; запись целой части в строку
	
	MOV dl, '.'
	MOV [di], dl
	INC di						;запись точки
	
	MOV ax, pointx
	
	CALL CONVERTERSTR				; запись дробной части в строку
	
	 ; запись праой границы функции в строку
	 
	MOV znak, 1
	; получение дробной части
	FLD1
	FLD QWORD PTR mas[3600]			; правая граница функции для дробной части
	FPREM
	FSTP
	FLDZ
	FCOM
	FSTP st(0)	
	FSTSW AX           
	SAHF
	JAE less_than_zero1
	JMP done_comparison1
less_than_zero1:
	FCHS
	MOV znak, -1
done_comparison1:
	FIMUL lenpoint
	FRNDINT
	FISTP WORD PTR pointx
	
	; получение целой части
	FLD1
	FLD QWORD PTR mas[3600]			; правая граница функции для дробной части
	FPREM
	FSTP
	FLD QWORD PTR mas[3600]			; правая граница функции для целой части
	FXCH
	FSUB
	FRNDINT
	FIMUL znak
	FISTP WORD PTR wholex
	
	MOV di, OFFSET rightx
	MOV ax, wholex
	
	CMP znak, 0
	JNL takeznak1
	MOV dl, '-'
	MOV [di], dl
	INC di
takeznak1:	
	
	CALL CONVERTERSTR				; запись целой части в строку
	
	MOV dl, '.'
	MOV [di], dl
	INC di						;запись точки
	
	MOV ax, pointx
	
	CALL CONVERTERSTR				; запись дробной части в строку
	
	 ; запись минимума функции в строку
	 
	MOV znak, 1
	; получение дробной части
	FLD1
	FLD QWORD PTR miny
	FPREM
	FSTP
	FLDZ
	FCOM
	FSTP st(0)	
	FSTSW AX           
	SAHF
	JAE less_than_zero2
	JMP done_comparison2
less_than_zero2:
	FCHS
	MOV znak, -1
done_comparison2:
	FIMUL lenpoint
	FRNDINT
	FISTP WORD PTR pointx
	
	; получение целой части
	FLD1
	FLD QWORD PTR miny		
	FPREM
	FSTP
	FLD QWORD PTR miny	
	FXCH
	FSUB
	FRNDINT
	FIMUL znak
	FISTP WORD PTR wholex
	
	MOV di, OFFSET minys
	MOV ax, wholex
	
	CMP znak, 0
	JNL takeznak2
	MOV dl, '-'
	MOV [di], dl
	INC di
takeznak2:	
	
	CALL CONVERTERSTR				; запись целой части в строку
	
	MOV dl, '.'
	MOV [di], dl
	INC di						;запись точки
	
	MOV ax, pointx
	
	CALL CONVERTERSTR				; запись дробной части в строку
	
	
	 ; запись максимума функции в строку
	 
	MOV znak, 1
	; получение дробной части
	FLD1
	FLD QWORD PTR maxy
	FPREM
	FSTP
	FLDZ
	FCOM
	FSTP st(0)	
	FSTSW AX           
	SAHF
	JAE less_than_zero3
	JMP done_comparison3
less_than_zero3:
	FCHS
	MOV znak, -1
done_comparison3:
	FIMUL lenpoint
	FRNDINT
	FISTP WORD PTR pointx
	
	; получение целой части
	FLD1
	FLD QWORD PTR maxy		
	FPREM
	FSTP
	FLD QWORD PTR maxy	
	FXCH
	FSUB
	FRNDINT
	FIMUL znak
	FISTP WORD PTR wholex
	
	MOV di, OFFSET maxys
	MOV ax, wholex
	
	CMP znak, 0
	JNL takeznak3
	MOV dl, '-'
	MOV [di], dl
	INC di
takeznak3:	
	
	CALL CONVERTERSTR				; запись целой части в строку
	
	MOV dl, '.'
	MOV [di], dl
	INC di						;запись точки
	
	MOV ax, pointx
	
	CALL CONVERTERSTR				; запись дробной части в строку


	
RET
floattostr ENDP

