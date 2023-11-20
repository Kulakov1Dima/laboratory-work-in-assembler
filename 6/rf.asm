readFile PROC 
	MOV ah, 03Fh
	MOV bx, [FileNumber]
	MOV cx, 40
	MOV dx, offset TextPlace
	INT 21h
	JC readerr

     ; Закрытие файла
	MOV bx, [FileNumber]
	MOV ah, 03Eh
	INT 21h

	RET
readFile ENDP
