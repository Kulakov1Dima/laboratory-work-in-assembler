toFloatA PROC 
	MOV di, 2
	MOV cx, 0
	MOV degree, 1
	FILD degree
TAKELENA:
	INC di
	INC cx
	CMP a[di], '.'
	JE LA
	CMP a[di], ','
	JE LA
	FIMUL deg
	JMP TAKELENA
LA:
	FISTP degree
	MOV di, 2
TAKEA:
	MOVZX edx, a[di]
	MOV curent, edx
	ADD curent, -48
	FILD curent 
	FIMUL degree
	FIADD dword ptr[numA]
	FISTP numA
	FILD degree
	FIDIV deg
	FISTP degree
	INC DI
	LOOP TAKEA
	
	FILD numA
	MOV degree, 10
	
TAKEPOINTA:
	INC di
	CMP a[di], 13
	JE LPA
	MOVZX edx, a[di]
	MOV curent, edx
	ADD curent, -48
	FILD curent 
	FIDIV degree
	FADD
	FILD degree
	FIMUL deg
	FISTP degree
	JMP TAKEPOINTA
LPA:
	FSTP QWORD PTR [numA]
	RET
toFloatA ENDP







toFloatB PROC 
	MOV di, 2
	MOV cx, 0
	MOV degree, 1
	FILD degree
TAKELENB:
	INC di
	INC cx
	CMP b[di], '.'
	JE LB
	CMP b[di], ','
	JE LB
	FIMUL deg
	JMP TAKELENB
LB:
	FISTP degree
	MOV di, 2
TAKEB:
	MOVZX edx, b[di]
	MOV curent, edx
	ADD curent, -48
	FILD curent 
	FIMUL degree
	FIADD dword ptr[numB]
	FISTP numB
	FILD degree
	FIDIV deg
	FISTP degree
	INC DI
	LOOP TAKEB
	
	FILD numB
	MOV degree, 10
	
TAKEPOINTB:
	INC di
	CMP b[di], 13
	JE LPB
	MOVZX edx, b[di]
	MOV curent, edx
	ADD curent, -48
	FILD curent 
	FIDIV degree
	FADD
	FILD degree
	FIMUL deg
	FISTP degree
	JMP TAKEPOINTB
LPB:
	FSTP QWORD PTR [numB]

	RET
toFloatB ENDP
