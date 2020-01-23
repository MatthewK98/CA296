;Question 3
;=====================================================================================================
;Write a program to display a string (any string) with uppercase and lowercase letters on the top row
;of the VDU (starting at C0) – you can do this using a combination of ORG/DB assembler
;directives. Display another string on the second row of the VDU (starting at D0).
;Write code which, when the program starts up, compares the two strings. If the two strings are equal
;a 00 should be placed in AL – otherwise a 01 should be placed in AL.
;Hints: Keep both strings short (less than 16 characters). Then you may assume that both strings are
;terminated by a null character (00).
;For 70% of the available marks, you may assume that both strings can be the same length. For
;100% of the marks, you should cater for the case where the strings are of different lengths.
;=====================================================================================================


;====================================================
;This a reattempt of the question (so no feedback)
;====================================================


;Two strings in the VDU
;==========================
org c0
db 41
db 42
db 43
db 44
db 45
db 5a
db 5a

org d0
db 41
db 42
db 43
db 44
db 45
db 5a
db 5a
;==========================





org 00		;Start at position 00 for the program to work
mov al,c0	;First line of the VDU
mov bl,d0	;Second line of the VDU


loop:
mov cl,[al]
mov dl,[bl]

cmp cl,dl	;Checks if character matches on both lines
jz True
Jnz False





True:		
cmp cl,20
jz break
inc al
inc bl
jmp loop




False:
mov al,01	;Put 01 in register Al if two lines dont match

break:
mov al,00	;Put 00 in register Al if two lines do match
end		;Ends program