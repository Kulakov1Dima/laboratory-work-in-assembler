getChar PROC

	cmp al, 'a'
	JE a
	cmp al, 'A'
	JE a
	cmp al, 'b'
	JE b
	cmp al, 'B'
	JE b
	cmp al, 'c'
	JE c
	cmp al, 'C'
	JE c
	cmp al, 'd'
	JE d
	cmp al, 'D'
	JE d
	cmp al, 'e'
	JE e
	cmp al, 'E'
	JE e
	cmp al, 'f'
  	JE f
  	cmp al, 'F'
  	JE f
  	cmp al, 'g'
  	JE g
  	cmp al, 'G'
  	JE g
  	cmp al, 'h'
  	JE h
  	cmp al, 'H'
  	JE h
  	cmp al, 'i'
  	JE i
  	cmp al, 'I'
  	JE i
 	cmp al, 'j'
  	JE j
  	cmp al, 'J'
  	JE j
  	cmp al, 'k'
  	JE k
  	cmp al, 'K'
  	JE k
  	cmp al, 'l'
  	JE l
  	cmp al, 'L'
  	JE l
  	cmp al, 'm'
  	JE m
  	cmp al, 'M'
  	JE m
  	cmp al, 'n'
  	JE n
  	cmp al, 'N'
  	JE n
  	cmp al, 'o'
  	JE o
  	cmp al, 'O'
  	JE o
  	cmp al, 'p'
  	JE p
  	cmp al, 'P'
  	JE p
  	cmp al, 'q'
  	JE q
  	cmp al, 'Q'
  	JE q
  	cmp al, 'r'
  	JE r
  	cmp al, 'R'
  	JE r
  	cmp al, 's'
  	JE s
  	cmp al, 'S'
  	JE s
  	cmp al, 't'
  	JE t
  	cmp al, 'T'
  	JE t
  	cmp al, 'u'
  	JE u
  	cmp al, 'U'
  	JE u
  	cmp al, 'v'
  	JE v
  	cmp al, 'V'
  	JE v
  	cmp al, 'w'
  	JE w
  	cmp al, 'W'
  	JE w
  	cmp al, 'x'
  	JE x
  	cmp al, 'X'
  	JE x
  	cmp al, 'y'
  	JE y
  	cmp al, 'Y'
  	JE y
  	cmp al, 'z'
  	JE z
  	cmp al, 'Z'
  	JE z
  	
  	JMP other

a:
	MOV si, offset pixela
	JMP ex
b:
	MOV si, offset pixelb
	JMP ex
c:
	MOV si, offset pixelc
	JMP ex
d:
	MOV si, offset pixeld
	JMP ex
e:
  	MOV si, offset pixele
  	JMP ex
f:
  	MOV si, offset pixelf
  	JMP ex
g:
  	MOV si, offset pixelg
  	JMP ex
h:
  	MOV si, offset pixelh
  	JMP ex
i:
  	MOV si, offset pixeli
  	JMP ex
j:
  	MOV si, offset pixelj
  	JMP ex
k:
  	MOV si, offset pixelk
  	JMP ex
l:
  	MOV si, offset pixell
  	JMP ex
m:
  	MOV si, offset pixelm
  	JMP ex
n:
  	MOV si, offset pixeln
  	JMP ex
o:
  	MOV si, offset pixelo
  	JMP ex
p:
  	MOV si, offset pixelp
  	JMP ex
q:
  	MOV si, offset pixelq
  	JMP ex
r:
  	MOV si, offset pixelr
  	JMP ex
s:
  	MOV si, offset pixels
  	JMP ex
t:
  	MOV si, offset pixelt
  	JMP ex
u:
  	MOV si, offset pixelu
  	JMP ex
v:
  	MOV si, offset pixelv
  	JMP ex
w:
  	MOV si, offset pixelw
  	JMP ex
x:
  	MOV si, offset pixelx
  	JMP ex
y:
  	MOV si, offset pixely
  	JMP ex
z:
  	MOV si, offset pixelz
  	JMP ex
  	
other:
	cmp al, '^'
	JE ddec1
	cmp al, '-'
	JE minb
	cmp al, '+'
	JE sum
	cmp al, '/'
	JE del1
	cmp al, '*'
	JE mu
	cmp al, ':'
	JE co
	cmp al, '='
	JE q1
	cmp al, ' '
	JE spse
	cmp al, '('
	JE br1
	cmp al, ')'
	JE br2
	cmp al, '0'
	JE zero
	cmp al, '1'
	JE one
	cmp al, '2'
	JE two
	cmp al, '3'
  	JE three
	cmp al, '4'
  	JE four
	cmp al, '5'
  	JE five
	cmp al, '6'
  	JE six
	cmp al, '7'
  	JE seven
	cmp al, '8'
  	JE eight
	cmp al, '9'
  	JE nine
ddec1:
	MOV si, offset ddec
	JMP ex
minb:
	MOV si, offset minus
	JMP ex
sum:
	MOV si, offset plus
	JMP ex
del1: 
	MOV si, offset divide
	JMP ex
mu:
	MOV si, offset multiply
	JMP ex
co:
	MOV si, offset colon
	JMP ex
q1:
	MOV si, offset qual
  	JMP ex
spse:
  	MOV si, offset space
  	JMP ex
br1:
	MOV si, offset bracket1
  	JMP ex
br2:
	MOV si, offset bracket2
  	JMP ex
zero:
  	MOV di, '0'
	CALL matrix
  	JMP ex
one:
  	MOV di, '1'
	CALL matrix
  	JMP ex
two:
  	MOV di, '2'
	CALL matrix
  	JMP ex
three:
  	MOV di, '3'
	CALL matrix
  	JMP ex
four:
  	MOV di, '4'
	CALL matrix
  	JMP ex
five:
  	MOV di, '5'
	CALL matrix
  	JMP ex
six:
	MOV di, '6'
	CALL matrix
  	JMP ex
seven:
  	MOV di, '7'
	CALL matrix
  	JMP ex
eight:
  	MOV di, '8'
	CALL matrix
  	JMP ex
nine:
  	MOV di, '9'
	CALL matrix
  	JMP ex

ex:
    	MOV di, offset curpix
    
    	MOV cx, 64
    	CLD
    	REP MOVSB	

RET
getChar ENDP
