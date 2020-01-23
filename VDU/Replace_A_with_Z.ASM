;Write a program to display an uppercase string on the screen using ORG C0 
;and suitable DBs. - When
;your program is started, it should replace all instances of "A" with "Z" - 
;Hint: you can use the CMP
;instruction to test if an "A" has been found



;This is where the string is entered for the VDU 
;==================
ORG C0   
DB 41
DB 5A
DB 42
DB 41
DB 41
DB 5A
DB 41
DB 42
;===================


org 00	;Need to begin at position 00 using ORG 00
mov al,c0 ;Put c0(vdu) in register AL


loop_vdu:	;Loop through the VDU
cmp bl,20	;When 20 is hit it will know that the string is finished 
jz break	;Jump to this label
mov bl,[al]
cmp bl,41	;If we find "A" in the string
jz True		;Jump to this label
inc al
jmp loop_vdu	;Return to loop_vdu


True:		;Will convert A to Z
mov cl,5a	
mov [al],cl
jmp loop_vdu	;Return to the orignal loop
break:
end	;Program ends