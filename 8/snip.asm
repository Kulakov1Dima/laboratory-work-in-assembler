SNIP_TOOL PROC
	PUSH es
	
	MOV ah, 0Fh      ; Получить текущий видеорежим
    	INT 10h
    	CMP al, 13h
    	JNE not_13h    
    	  
	CALL SAVEVIDMODE
	CALL INFO	
	
	JMP snip_end
not_13h:
	CALL SAVEVIDMODE
	CALL ERROR_INFO	   
snip_end:
	CALL RETURNVIDMODE
	POP es
	RET
SNIP_TOOL ENDP