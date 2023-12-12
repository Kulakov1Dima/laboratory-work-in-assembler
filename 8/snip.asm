SNIP_TOOL PROC
	MOV ah, 0Fh      ; Получить текущий видеорежим
    	INT 10h
    	CMP al, 13h
    	JNE not_13h      
	
	
	JMP snip_end
not_13h:
	CALL SAVEVIDMODE
	
	PUSH es
	CALL ERROR_INFO	
	POP es

	CALL RETURNVIDMODE
	    
snip_end:
	RET
SNIP_TOOL ENDP