.MODEL small
.STACK 100h

.DATA
	buffer db  10, 100 dup ("$"), 0, 0
	message1 db "enter a 16-digit: $", 0, 0
	message2 db  "correct number$", 0, 0
	message3 db  "uncorrect number$", 0, 0
.CODE

include labs/macros.inc
include labs/checkhex.asm

main PROC
    
    mov ax,@data
    mov ds,ax
        
    print_s message1
    input_s buffer

    call hex
    
    mov ah, 4Ch
    int 21h

main ENDP
END main