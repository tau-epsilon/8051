; ALP to multiply numbers at 30H and 31H and store 16 bit result in 32H(lower) and 33H(higher)
	ORG	0000H
	MOV	30H, #0FFH
	MOV	31H, #0FFH
	MOV	A, 30H
	MOV	B, 31H
	MUL	AB
	MOV	32H, A		; lower byte
	MOV	33H, B		; higher byte
	SJMP	$
	END