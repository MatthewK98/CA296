ORG 8F
DB 00  ;end of string
DB FA  ;0
DB A
DB B6
DB 9E
DB 4E
DB DC
DB 7C
DB 8A
DB FE
DB CE ; 9


;------ right 7 segment display
ORG 9F
DB 00 ; end of string
DB FB ; 0
DB B
DB B7
DB 9F
DB 4F
DB DD
DB 7D
DB 8B
DB FF
DB CF ; 9


;-------------start of program -------------
ORG 00
;left handside
MOV BL, 99
MOV AL, [BL]
OUT 2

;right handside
MOV CL, A9
MOV AL, [CL]
OUT 2  ; start with 9 in both

CALL 50
HALT

ORG 50

rightdigit:
	DEC CL
	MOV AL, [CL]
	CMP AL, 00  ; make sure its not end of table
	JZ leftdigit ; if it is change the left digit
	OUT 2       ; if its not display in 7SD
	JMP rightdigit


leftdigit:
	DEC BL
	MOV AL, [BL]
	CMP AL, 00
	JZ loopend

	OUT 2
	MOV CL, AA
	JMP rightdigit


loopend:
	RET


END
