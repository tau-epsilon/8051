;;; ALP to add byte in 35H(IRAM) and 34H(IRAM) and store in R5(LSB) and R6(MSB)

	ORG	0000H
	MOV	A, 35H
	ADD	A, 34H
	JNC	NEXT
	INC	R6
NEXT:	MOV	R5, A
	END