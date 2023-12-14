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

PlaySound PROC
    MOV AL, 182         ; Загрузить 182 в регистр AL
    OUT 43h, AL         ; Отправить значение в порт 43h

    MOV AX, 0C200h      ; Загрузить 0C200h в регистр AX
    OUT 42h, AL         ; Отправить младший байт в порт 42h
    MOV AL, AH          ; Переместить старший байт в AL
    OUT 42h, AL         ; Отправить старший байт в порт 42h

    MOV AL, 3           ; Загрузить 3 в регистр AL (установка частоты)
    OUT 61h, AL         ; Отправить значение в порт 61h

    MOV BX, 5000        ; Загрузить 5000 в регистр BX (задержка)
DelayLoop:
    DEC BX              ; Уменьшить значение в BX
    JNZ DelayLoop       ; Перейти к метке DelayLoop до тех пор, пока BX не станет равным 0

    MOV AL, 182         ; Сбросить порт 61h
    OUT 61h, AL

    RET                 ; Возврат из функции
PlaySound ENDP