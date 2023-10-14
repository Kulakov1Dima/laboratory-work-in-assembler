.MODEL small
.STACK 100h

.DATA
	buffer db  10, 100 dup ('$'), 0, 0
	message1 db "enter a 16-digit: $", 0, 0
	message2 db  "that 's true$", 0, 0
	message3 db  10, 13, "uncorrect number$"
    done_message db 10, 13, "binary number: $"

    bin0 db "0000 $", 0, 0
    bin1 db "0001 $", 0, 0
    bin2 db "0010 $", 0, 0
    bin3 db "0011 $", 0, 0
    bin4 db "0100 $", 0, 0
    bin5 db "0101 $", 0, 0
    bin6 db "0110 $", 0, 0
    bin7 db "0111 $", 0, 0
    bin8 db "1000 $", 0, 0
    bin9 db "1001 $", 0, 0
    bin10 db "1010 $", 0, 0
    bin11 db "1011 $", 0, 0
    bin12 db "1100 $", 0, 0
    bin13 db "1101 $", 0, 0
    bin14 db "1110 $", 0, 0
    bin15 db "1111 $", 0, 0

.CODE

include labs/macros.inc
include labs/checkhex.asm
include labs/getbin.asm

main PROC
    
    mov ax,@data
    mov ds,ax
    
    print_s message1
    input_s buffer

    call hex
    cmp al, 0
    jz out_program
    
    call binary

out_program:
    mov ah, 4Ch
    int 21h

main ENDP
END main