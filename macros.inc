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

b0 MACRO msg
    cmp dl, '0'
    jz zero
    jne nozero
zero:
    lea dx, bin0
    int 21h
nozero:
endm

b1 MACRO msg
    cmp dl, '1'
    jz one
    jne noone
one:
    lea dx, bin1
    int 21h
noone:
endm

b2 MACRO msg
    cmp dl, '2'
    jz two
    jne notwo
two:
    lea dx, bin2
    int 21h
notwo:
endm

b3 MACRO msg
    cmp dl, '3'
    jz three
    jne nothree
three:
    lea dx, bin3
    int 21h
nothree:
endm

b4 MACRO msg
    cmp dl, '4'
    jz four
    jne nofour
four:
    lea dx, bin4
    int 21h
nofour:
endm

b5 MACRO msg
    cmp dl, '5'
    jz five
    jne nofive
five:
    lea dx, bin5
    int 21h
nofive:
endm

b6 MACRO msg
    cmp dl, '6'
    jz six
    jne nosix
six:
    lea dx, bin6
    int 21h
nosix:
endm

b7 MACRO msg
    cmp dl, '7'
    jz seven
    jne noseven
seven:
    lea dx, bin7
    int 21h
noseven:
endm

b8 MACRO msg
    cmp dl, '8'
    jz eight
    jne noeight
eight:
    lea dx, bin8
    int 21h
noeight:
endm

b9 MACRO msg
    cmp dl, '9'
    jz nine
    jne nonine
nine:
    lea dx, bin9
    int 21h
nonine:
endm

b10 MACRO
    cmp dl, 'A'
    jz ten
    cmp dl, 'a'
    jz ten
    jne noten
ten:
    lea dx, bin10
    int 21h
noten:
endm

b11 MACRO
    cmp dl, 'B'
    jz eleven
    cmp dl, 'b'
    jz eleven
    jne noteleven
eleven:
    lea dx, bin11
    int 21h
noteleven:
endm

b12 MACRO
    cmp dl, 'C'
    jz twelve
    cmp dl, 'c'
    jz twelve
    jne notwelve
twelve:
    lea dx, bin12
    int 21h
notwelve:
endm

b13 MACRO 
    cmp dl, 'D'
    jz thirteen
    cmp dl, 'd'
    jz thirteen
    jne nothirteen
thirteen:
    lea dx, bin13
    int 21h
nothirteen:
endm

b14 MACRO
    cmp dl, 'E'
    jz fourteen
    cmp dl, 'e'
    jz fourteen
    jne notfourteen
fourteen:
    lea dx, bin14
    int 21h
notfourteen:
endm

b15 MACRO
    cmp dl, 'F'
    jz fifteen
    cmp dl, 'f'
    jz fifteen
    jne notfifteen
fifteen:
    lea dx, bin15
    int 21h
notfifteen:
endm
