; ALP to seperate +ve and -ve nos in an array
	ORG	0000H
	MOV DPTR, #30H ; array base ptr
	MOV R0, #40H ; +ve array base ptr
	MOV R1, #50H ; -ve array base ptr
	MOV R2, #8 ; 8 elements counter
BACK:
	MOVX A, @DPTR
	JNB ACC.7, POSITIVE
	INC DPTR
	MOV @R1, A
	INC R1
	SJMP CONTINUE
POSITIVE:
	MOV @R0, A
	INC R0
CONTINUE:
	DJNZ R2, BACK
	SJMP $
	END
