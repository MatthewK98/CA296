mov al,41   ;Starting with letter A
mov bl,c0   ;c0 is the starting location for the VDU


loop:
cmp al, 5B	;Comparing al to the character after "Z"
jz break	;If True jump to the label "break"
mov [bl],al	;Putting the specific letter into the vdu
inc al		;Increment al
inc bl		;Increment bl
jmp loop        ;Jump back to the loop

break:
end	;End the program