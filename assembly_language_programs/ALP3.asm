; ALP to exchange source blocks at 20H(IRAM) with 40H(IRAM)
	ORG	0000H
;;; MOVING data into 20H(src)
	MOV	R0, #5		; count
	MOV	R1, #20H	; src
MOVIN:
	MOV	@R1, #0FFH
	INC	R1
	DJNZ	R0, MOVIN
;;; MOVING ends
	MOV	R0, #20H	; src ptr
	MOV	R1, #40H	; dest ptr
	MOV	R3, #5		; count
MOVE:
	MOV	A, @R0
	XCH	A, @R1
	MOV	@R0, A
	INC	R0
	INC	R1
	DJNZ	R3, MOVE
	END