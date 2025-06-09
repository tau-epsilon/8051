; ALP to perform division of two 8 bit numbers
	ORG	0000H
	MOV	A, #0FFH
	MOV B, #01H
	DIV AB
	SJMP $
	END