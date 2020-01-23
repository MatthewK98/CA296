;Question 2
;=================================
;Write a program to get a digit (0-9) from the simple keyboard. If the character entered is not a
;digit, the character should be read again, until a digit is entered. A second digit should then be read
;into your program in the same way. When both digits have been read in, the smaller of the two
;numbers should be left in AL when the program halts. Hint: some CMP commands and labels could
;be useful.
;=================================





;Donal's feedback
;====================================================
; this is good, but you have repetitive code.
; look at how you are reading the digits  The code is almost identical.
; so could you streamline this by using the same piece
; of code in a loop, and using a counter
; to do different things depending on whether
;it's the first or second digit?
;=====================================================



loop:  	;We need to keep looping until a digit is entered
in 00   ;This is used for input for the simple keyboard
cmp al,30  ;Must not be less than 30
js loop    ;If less than 30 go back to the loop and enter another input

cmp al,3A  ;Must not be greater than 3A
jns loop   ;If greater than 3A go back to the loop and enter another input
sub al,30  ;Im subtracting just so I can have a simple single digit , for example I enter 3 it will be 33 I subtract 30 to give me 03
push al    ;Store it in the stack
pop bl     ;Lets pop that number into the register bl to store it 
jmp second_number  ;Once I hit this Jmp , I know everything is True and we can enter our second input

second_number:   ;Label
in 00		;This is used for input for the simple keyboard
cmp al,3a	;Must not be less than 30
jns second_number ;If greater than 3A go back to the loop and enter another input
sub al, 30        ;Im subtracting just so I can have a simple single digit , for example I enter 3 it will be 33 I subtract 30 to give me 03
push al 	;Store it in the stack
mov al,00       ;Reset register al
pop cl		;Lets put the stack number into cl

jmp smaller   ;Jmp to the label smaller to find the smaller number


smaller:
   
    sub bl,cl     	;I use subtract so I can check if number is positive or negative
    js BL_IS_SMALLER  	;When Bl is smaller
    jns CL_IS_SMALLER	;When Cl is smaller


BL_IS_SMALLER:
  add bl,cl    ;Reset bl
  push bl      ;Put into stack
  pop al       ;Put into al
  jmp break    ;Go to break to end our program
    
CL_IS_SMALLER:
  push cl      ;Put number in cl into the stack
  pop al       ;Put it into the register al
  jmp break    ;Go to break to end our program

break:
    end		;End our program