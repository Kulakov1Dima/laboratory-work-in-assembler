include labs/1/deg.asm

GETDEC PROC
    MOV ax, 0
    MOV si, offset [buffer+2]	
    MOV bl, 0
    LEN:
	MOV dx, [si]

	PUSH cx
	PUSH si
	convernt
	POP si
	POP cx
	
	PUSH ax
	PUSH cx
	CALL DEGREE
	POP cx
	POP ax

	ADD ax, dx

	INC si
	INC bl
        LOOP LEN

DONEDEC:
    MOV decnum, ax
    RET

GETDEC ENDP