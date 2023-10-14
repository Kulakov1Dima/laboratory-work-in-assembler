print_s MACRO msg
    mov ah, 9
    lea dx, msg
    int 21h
endm

input_s MACRO msg
    mov ah, 10
    lea dx, msg
    int 21h
endm

b0 MACRO
    push si
    cmp dl, '0'
    jz zero
    jne nozero
zero:
    lea si, bin0
copy:
    mov al, [si]
    cmp al, '$'
    je nozero

    mov [di], al

    inc si
    inc di
    jmp copy
nozero:
    pop si
ENDM

b1 MACRO msg
    push si
    cmp dl, '1'
    jz one
    jne noone
one:
    lea si, bin1
copy1:
    mov al, [si]
    cmp al, '$'
    je noone

    mov [di], al

    inc si
    inc di
    jmp copy1
noone:
    pop si
endm

b2 MACRO msg
    push si
    cmp dl, '2'
    jz two
    jne notwo
two:
    lea si, bin2
copy2:
    mov al, [si]
    cmp al, '$'
    je notwo

    mov [di], al

    inc si
    inc di
    jmp copy2
notwo:
    pop si
endm

b3 MACRO msg
    push si
    cmp dl, '3'
    jz three
    jne nothree
three:
    lea si, bin3
copy3:
    mov al, [si]
    cmp al, '$'
    je nothree

    mov [di], al

    inc si
    inc di
    jmp copy3
nothree:
    pop si
endm

b4 MACRO msg
    push si
    cmp dl, '4'
    jz four
    jne nofour
four:
    lea si, bin4
copy4:
    mov al, [si]
    cmp al, '$'
    je nofour

    mov [di], al

    inc si
    inc di
    jmp copy4
nofour:
    pop si
endm

b5 MACRO msg
    push si
    cmp dl, '5'
    jz five
    jne nofive
five:
    lea si, bin5
copy5:
    mov al, [si]
    cmp al, '$'
    je nofive

    mov [di], al

    inc si
    inc di
    jmp copy5
nofive:
    pop si
endm

b6 MACRO msg
    push si
    cmp dl, '6'
    jz six
    jne nosix
six:
    lea si, bin6
copy6:
    mov al, [si]
    cmp al, '$'
    je nosix

    mov [di], al

    inc si
    inc di
    jmp copy6
nosix:
    pop si
endm

b7 MACRO msg
    push si
    cmp dl, '7'
    jz seven
    jne noseven
seven:
    lea si, bin7
copy7:
    mov al, [si]
    cmp al, '$'
    je noseven

    mov [di], al

    inc si
    inc di
    jmp copy7
noseven:
    pop si
endm

b8 MACRO msg
    push si
    cmp dl, '8'
    jz eight
    jne noeight
eight:
    lea si, bin8
copy8:
    mov al, [si]
    cmp al, '$'
    je noeight

    mov [di], al

    inc si
    inc di
    jmp copy8
noeight:
    pop si
endm

b9 MACRO msg
    push si
    cmp dl, '9'
    jz nine
    jne nonine
nine:
    lea si, bin9
copy9:
    mov al, [si]
    cmp al, '$'
    je nonine

    mov [di], al

    inc si
    inc di
    jmp copy9
nonine:
    pop si
endm

b10 MACRO
    push si
    cmp dl, 'A'
    jz ten
    cmp dl, 'a'
    jz ten
    jne noten
ten:
    lea si, bin10
copy10:
    mov al, [si]
    cmp al, '$'
    je noten

    mov [di], al

    inc si
    inc di
    jmp copy10
noten:
    pop si
endm

b11 MACRO
    push si
    cmp dl, 'B'
    jz eleven
    cmp dl, 'b'
    jz eleven
    jne noeleven
eleven:
    lea si, bin11
copy11:
    mov al, [si]
    cmp al, '$'
    je noeleven

    mov [di], al

    inc si
    inc di
    jmp copy11
noeleven:
    pop si
endm

b12 MACRO
    push si
    cmp dl, 'C'
    jz twelve
    cmp dl, 'c'
    jz twelve
    jne notwelve
twelve:
    lea si, bin12
copy12:
    mov al, [si]
    cmp al, '$'
    je notwelve

    mov [di], al

    inc si
    inc di
    jmp copy12
notwelve:
    pop si
endm

b13 MACRO
    push si
    cmp dl, 'D'
    jz thirteen
    cmp dl, 'd'
    jz thirteen
    jne notthirteen
thirteen:
    lea si, bin13
copy13:
    mov al, [si]
    cmp al, '$'
    je notthirteen

    mov [di], al

    inc si
    inc di
    jmp copy13
notthirteen:
    pop si
endm

b14 MACRO
    push si
    cmp dl, 'E'
    jz fourteen
    cmp dl, 'e'
    jz fourteen
    jne notfourteen
fourteen:
    lea si, bin14
copy14:
    mov al, [si]
    cmp al, '$'
    je notfourteen

    mov [di], al

    inc si
    inc di
    jmp copy14
notfourteen:
    pop si
endm

b15 MACRO
    push si
    cmp dl, 'F'
    jz fifteen
    cmp dl, 'f'
    jz fifteen
    jne notfifteen
fifteen:
    lea si, bin15
copy15:
    mov al, [si]
    cmp al, '$'
    je notfifteen

    mov [di], al

    inc si
    inc di
    jmp copy15
notfifteen:
    pop si
endm
