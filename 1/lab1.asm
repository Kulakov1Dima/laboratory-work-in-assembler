.MODEL small
.STACK 100h
.386

.DATA

	DIGITS DB 'A', 'B', 'C', 'D', 'E', 'F'
	VALUES DB 10, 11, 12, 13, 14, 15

	buffer db 6, 5 dup ('$')
	message1 db "enter a 16-digit: $", 0, 0
	message3 db  10, 13, "uncorrect number$"
	message4 db  10, 13, "overflow$"
	done_message db 10, 13, "binary number: $"

	bin0 db "0000$"
   	bin1 db "0001$"
  	bin2 db "0010$"
    	bin3 db "0011$"
    	bin4 db "0100$"
    	bin5 db "0101$"
    	bin6 db "0110$"
    	bin7 db "0111$"
    	bin8 db "1000$"
    	bin9 db "1001$"
    	bin10 db "1010$"
    	bin11 db "1011$"
    	bin12 db "1100$"
    	bin13 db "1101$"
    	bin14 db "1110$"
    	bin15 db "1111$"
 	
	outbin db  500 dup ('$')

	error db "incorrect number$"
buff    db 6,7 Dup(?)

	current db 0
	deg dw 1
	decnum dd 0

.CODE
include labs/1/macros.inc
include labs/1/checkhex.asm
include labs/1/fromHex.asm
include labs/1/tobin.asm

MAIN PROC
    my_start message1, buffer
    CALL hex

    CMP al, 0
    jz OUT_PROGRAM
    CALL GETDEC
    CMP al, 0
    jz OUT_PROGRAM

    CALL TOBIN
    print_s outbin

OUT_PROGRAM:
    MOV ah, 4Ch
    INT 21h

MAIN ENDP
END main