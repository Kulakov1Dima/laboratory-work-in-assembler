WRITE8X8 PROC
	MOV bx, 0
		MOV si, 0
		loopx:
			MOV di, 0
			loopy:	
				PUSH di
				PUSH dx
				MOV ax, dx
				ADD ax, si
				MOV dx, 320
				MUL dx
				ADD di, ax
				ADD di, cx
				POP dx
				MOV al, curpix[bx]
				CMP al, 15
				JE offfon
				MOV es:[di], al	
				offfon:
				POP di
				
				INC di
				INC bx
				CMP di, 8
				JNE loopy
			INC si
			CMP si, 8
			JNE loopx
	RET
WRITE8X8 ENDP
