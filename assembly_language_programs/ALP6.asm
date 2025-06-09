; ALP to subtract byte in 34H from 35H and store result in R5 and borrow in R6
		ORG 0000H
		MOV 34H, #5
		MOV 35H, #6
		CLR C
		MOV A, 35H
		SUBB A, 34H
		JNC NEXT
		INC R6
NEXT:	MOV R5, A
		SJMP $
		END