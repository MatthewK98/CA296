;count down from 9 using left hand side



ORG 8F
DB 00 ; start of table
DB FA
DB A
DB B6
DB 9E
DB 4E
DB DC
DB 7C
DB 8A
DB FE
DB CE
DB EE
DB FE
DB F0
DB FA
DB F4
DB E4
DB FF ; end of table


ORG 00

MOV CL, 99 ; keeps track of location in table (9)
MOV AL, [CL] ; moves digit into AL

LOOP: ; to display decimal on 7SD
	OUT 02
	
	DEC CL
	MOV AL, [CL]
	CMP AL, 00
	JZ LOOPEND

	JMP LOOP
	
	

LOOPEND:
	END