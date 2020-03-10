.model tiny
.data

str1 db 'ENTER USER NAME $'
str2 db 'ENTER PASSWORD $'
welcome_str db 'HELLO ARAVINDAN $'
USR_NAME db 'ARAVINDAN'
PASSWORD db '123'

max1 db 10
act1 db ?
inp1 db 10 dup(?)

max2 db 4
act2 db ?
inp2 db 4 dup(?)

.code
.startup

lea dx,str1;0152
MOV AH,09H
INT 21H

lea dx,max1;018E
lea si,inp1;0192
lea di,USR_NAME;0184
mov cx,09H
cld
mov AH,0AH
int 21H
repe cmpsb
cmp cx,00
jnz e
q
lea dx,str2;0163
MOV AH,09H
INT 21H

lea dx,max2;019A
lea si,inp2;019E
lea di,PASSWORD;018B
mov cx,03H
cld
mov AH,0AH
int 21H
repe cmpsb
cmp cx,00
JNZ e

lea dx,welcome_str;0173
MOV AH,09H
INT 21H

e:
.exit
end