; ALP to move n bytes from 2000H (XRAM) to 4000H (XRAM)
;; 2000H = 8192(decimal)
;; 4000H = 16384(decimal)
;; 4005H = 16389(decimal)
;;; Make sure you enable external RAM in MCU
	ORG	0000H
;;; MOVING data into 2000H XRAM (for sim purpose)
	MOV	R0, #5
	MOV	DPTR, #2000H
MOVIN:
	MOV	A, #0FFH
	MOVX	@DPTR, A
	INC	DPTR
	DJNZ	R0, MOVIN
;;; MOVING completed
	MOV	R0, #20H	; DPH (src)
	MOV	R1, #00H	; DPL (src)
	MOV	R2, #40H	; DPH (dest)
	MOV	R3, #00H	; DPL (dest)
	MOV	R4, #5
MOVE:
	MOV	DPH, R0
	MOV	DPL, R1
	MOVX	A, @DPTR
	MOV	DPH, R2
	MOV	DPL, R3
	MOVX	@DPTR, A
	INC	R1
	INC	R3
	DJNZ	R4, MOVE
	END