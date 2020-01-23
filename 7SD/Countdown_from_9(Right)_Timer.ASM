org 60
db cf
db ff
db 8b
db 7d
db dd
db 4f
db 9f
db b7
db b
db fb

org 00
jmp init
db 70




org 30
init:
mov cl, 60
mov bl, a

loop:
sti
jmp loop

org 40
loop2:
cli


org 70
start:
mov al,[cl]
out 02


inc cl
dec bl
cmp bl,00
jz finish
iret


finish:
end