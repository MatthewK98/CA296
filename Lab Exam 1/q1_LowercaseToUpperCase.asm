;Question 1
;====================
;Write a program to get a lowercase character (a-z) from the simple keyboard. If the character
;entered is not a lowercase letter, the character should be read again, until an lowercase character
;is entered. When the lowercase character has been read in, it should be converted to uppercase
;and displayed on the top-left of the VDU. Hint: some CMP commands and labels could be useful.
;====================


;Donal's feedback
;======================
; this is excellent.
;======================





mov bl,c0 	;We need a register to add our input in to the vdu c0 is starting position of the VDU
loop:
in 00  ;Used to get input from the simple keyboard
cmp al,61 ;Check anything less than 61
js loop   ;
cmp al,7b ;Check anything greater than 7B
jns loop
jz vdu 	; When its True it will put the lowercase in to the label vdu





vdu:
   sub al,20   ;Converts it to uppercase	
   mov [bl],al ;Simply puts the uppercase into the vdu
end