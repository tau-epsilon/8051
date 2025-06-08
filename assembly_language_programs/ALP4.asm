; ALP to exchange source block (6 bytes) at 10H(IRAM) with 00H(XRAM)
	ORG	0000H
;;; MOVING data into IRAM
	MOV	R0, #6		; count
	MOV	R1, #10H	; dest
MOVIN:	MOV	@R1, #0FFH
	INC	R1
	DJNZ	R0, MOVIN
;;; MOVING data done
;;; MOVING data into XRAM
	MOV	R0, #6		; count
	MOV	DPTR, #00H	; dest
	MOV	A, #45H		; data
XMOVIN:	MOVX	@DPTR, A
	INC	DPTR
	DJNZ	R0, XMOVIN
;;; MOVING done
	MOV	DPTR, #00H
	MOV	R1, #10H
	MOV	R2, #6
XCHANGE:
	MOVX	A, @DPTR
	XCH	A, @R1
	MOVX	@DPTR, A
	INC	DPTR
	INC	R1
	DJNZ	R2, XCHANGE
	END