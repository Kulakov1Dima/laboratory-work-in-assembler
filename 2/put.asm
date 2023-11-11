input PROC
MOV ah, 09h
	MOV dx, OFFSET message1
	INT 21h
	MOV ah, 0Ah
    	MOV dx, OFFSET num
    	INT 21h
    	MOVZX cx, byte ptr[num+2]
    	ADD cx, -48

	CMP cx, 2
	JL ERORJL
	
	MOV ah, 09h
	MOV dx, OFFSET message2
	INT 21h
	MOV ah, 0Ah
	MOV dx, OFFSET a
	INT 21h
	MOV ah, 09h
	MOV dx, OFFSET message3
	INT 21h
	MOV ah, 0Ah
	MOV dx, OFFSET b
	INT 21h
	RET
ERORJL:
    MOV ah, 09h
    MOV dx, OFFSET message4
    INT 21h
    MOV ah, 4Ch
    INT 21h
    RET
input ENDP
