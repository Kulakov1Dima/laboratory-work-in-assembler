.MODEL small
.STACK 100h
.386

.DATA

	DIGITS DB 'A', 'B', 'C', 'D', 'E', 'F'
	VALUES DB 10, 11, 12, 13, 14, 15

	buffer db 100 dup ('$')
	message1 db "enter a 16-digit: $", 0, 0
	message3 db  10, 13, "uncorrect number$"
	done_message db 10, 13, "decimal number: $"

	decnum dw 0

.CODE
include labs/1/macros.inc
include labs/1/checkhex.asm
include labs/1/fromHex.asm

MAIN PROC
    my_start message1, buffer
    CALL hex

    CMP al, 0
    jz OUT_PROGRAM
    CALL GETDEC

    print_s done_message

    MOV ah, 2
    MOV dx, decnum
    INT 21h 

OUT_PROGRAM:
    MOV ah, 4Ch
    INT 21h

MAIN ENDP
END main