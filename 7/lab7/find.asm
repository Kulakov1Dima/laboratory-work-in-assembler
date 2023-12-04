FINDEXT PROC
MOV cx, numN  ; Количество элементов в массиве
	LEA SI, masy
		
FIND_MAX:
	FLD qword ptr [SI]
	FCOM qword ptr maxy
	FSTSW AX
	SAHF	
	JA UPDATE_MAX
	JMP CONTINUEMAX
		
UPDATE_MAX:
	FST qword ptr maxy

CONTINUEMAX:
	FFREE ST(0)
	ADD SI, 8  ; Переход к следующему элементу
	LOOP FIND_MAX
	
	MOV cx, numN  ; Количество элементов в массиве
	LEA SI, masy
		
FIND_MIN:
	FLD qword ptr [SI]
	FCOM qword ptr miny
	FSTSW AX
	SAHF	
	JB UPDATE_MIN
	JMP CONTINUEMIN
		
UPDATE_MIN:
	FST qword ptr miny

CONTINUEMIN:
	FFREE ST(0)
	ADD SI, 8  ; Переход к следующему элементу
	LOOP FIND_MIN

RET
FINDEXT ENDP
