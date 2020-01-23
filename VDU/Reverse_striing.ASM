
;Code below is the string
;===============
org c0	;VDU
db 48
db 45
db 4c
db 4c
db 4f
db 57
db 4f
db 52
db 4c
db 44
;===============




org 00		;Need to start at position 00 for the program to work
mov al,c0	;Vdu
mov cl,d0	;Second line of the Vdu
loop:		;Loop find length of string
mov bl,[al]     
cmp bl,20
jz decrement
inc al
jmp loop



decrement:
dec al	;This is to help get the last character of the first line



reverse:	
cmp al,bf
jz break  ;When True will break
mov bl,[al] 	
mov [cl],bl
dec al
inc cl
jmp reverse

break:
end	;Ends program