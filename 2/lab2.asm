.MODEL small
.STACK 100h
.386

.DATA
	message1 db "enter a number: $", 0
	message4 db 10, "number must not be less two $", 0
	message2 db 10, "enter a number A: $", 0
	message3 db 10, "enter a number B: $", 0
	curent dd 0
	degree dd 1
	deg dd 10
	num db 2, 1, ?, 0
	a db 9, 8, 8 DUP(0), 0
	b db 9, 8, 8 DUP(0), 0
	numN dd 0
	numA dq 0.0
	numB dq 0.0
	delta dq 0.0
	del dd 5
	mas dq 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
	masy dq 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
.CODE

include labs/2/tofloat.asm
include labs/2/put.asm
include labs/2/f.asm

MAIN PROC
	MOV ax,@DATA
	MOV ds,ax
	CALL input
	FINIT
	CALL toFloatA
	CALL toFloatB
	
	MOVZX edx, num[2]
	ADD edx, -48
	MOV numN, edx
	
	FLD numB
	FLD numA
	FSUB
	FIDIV numN
	FSTP QWORD PTR [delta]
	
	FLD numA
	MOV cx, WORD PTR [numN]
	XOR di, di
TAKEMAS:
	FST QWORD PTR [mas[di]]
        FILD del

	CALL funk

	FSTP QWORD PTR [masy[di]]
	FLD masy[di] ; проверка 
	FFREE ST(0)


	FLD mas[di]
	FLD delta
	FADD
	INC di
LOOP TAKEMAS
	FFREE ST(0)
	
	MOV ah, 4Ch
	INT 21h
MAIN ENDP
END MAIN