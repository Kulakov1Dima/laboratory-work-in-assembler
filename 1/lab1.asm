.MODEL small
.STACK 100h

.DATA
	buffer db 100 dup ('$')
	message1 db "enter a 16-digit: $"
    message2 db  10, 13, "uncorrect length$"
	message3 db  10, 13, "uncorrect number$"
    done_message db 10, 13, "binary number: $"

    bin0 db "0000 $"
    bin1 db "0001 $"
    bin2 db "0010 $"
    bin3 db "0011 $"
    bin4 db "0100 $"
    bin5 db "0101 $"
    bin6 db "0110 $"
    bin7 db "0111 $"
    bin8 db "1000 $"
    bin9 db "1001 $"
    bin10 db "1010 $"
    bin11 db "1011 $"
    bin12 db "1100 $"
    bin13 db "1101 $"
    bin14 db "1110 $"
    bin15 db "1111 $"

    outbin db  500 dup ('$')

.CODE

include labs/1/macros.inc
include labs/1/checkhex.asm
include labs/1/getbin.asm

main PROC
    
    mov ax,@data
    mov ds,ax
    
    print_s message1
    input_s buffer

    call hex

    cmp al, 0
    jz out_program
    
    call binary

    cmp al, 0
    jz out_program

    print_s outbin

out_program:
    mov ah, 4Ch
    int 21h

main ENDP
END main