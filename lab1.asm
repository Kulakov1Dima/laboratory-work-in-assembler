.MODEL small
.STACK 100h

.DATA
source db "Kulakov Dima$", 0, 0

.CODE
main PROC
    include labs/macros.inc
    
    mov ax,@data
    mov ds,ax
    
    lea dx, source
    mov ah, 9
    int 21h

    mov ah, 4Ch
    int 21h

main ENDP
END main