getDescriptor PROC
open:
	MOV ah, 09h
	MOV dx, OFFSET message1
	INT 21h
	; Открытие файла для чтения
	mov ah, 3Dh
	mov al, 0
	mov dx, OFFSET FileName
	int 21h    
	JNB next1	
	;ошибки
	CMP ax, 02h
	JE noFile
	CMP ax, 03h
	JE noPath
	CMP ax, 04h
	JE manyFiles
	CMP ax, 05h
	JE noAccess
	JNE next1
noFile:
	MOV ah, 09h
	MOV dx, OFFSET message2
	INT 21h
	JMP addFile
noPath:
	MOV ah, 09h
	MOV dx, OFFSET message3
	INT 21h
	JMP exit1
manyFiles:
	MOV ah, 09h
	MOV dx, OFFSET message4
	INT 21h
	JMP exit1
noAccess:
	MOV ah, 09h
	MOV dx, OFFSET message5
	INT 21h
	JMP exit1
addFile:
	MOV ah, 09h
	MOV dx, OFFSET addmessage1
	INT 21h
	
	MOV ah, 0Ah
	MOV dx, OFFSET addAccess
	INT 21h
	
	MOV si, OFFSET [addAccess+2]
	MOV dl, [si]
	CMP dl, 'Y'
	JNE exit1
	;создаём файл
	MOV [addAccess+1], 0
	MOV ah, 3Ch
	MOV cx, 0
	MOV dx, OFFSET FileName
	INT 21h
	
	MOV [FileNumber], ax
	PUSH ax
	; Запись строки в файл
	MOV ah, 040h
	MOV bx, [FileNumber]
	MOV cx, lenText
	MOV dx, OFFSET TextLine
	INT 21h
	POP ax
	JC error
	
	; Закрытие файла
	MOV bx, [FileNumber]
	MOV ah, 03Eh
	INT 21h
	JMP open
error:
	MOV dx, OFFSET TextError
	MOV ah, 9
	INT 21h
exit1:
	MOV ah, 4Ch
	INT 21h
next1:
	; Сохранение файлового дескриптора
	MOV [FileNumber], ax
	RET
getDescriptor ENDP