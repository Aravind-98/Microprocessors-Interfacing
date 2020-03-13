.model tiny
.386
.data
filename db 'mup.txt',0
filehandle dw ?
read_buffer db 69 dup('$')

.code
.startup
; first step is to open the file in r/w mode
mov ah,3DH
lea dx,filename
mov al,02H
int 21H

JC exit ;if error in opening then exit the program

mov filehandle,ax
mov bx,filehandle
mov cx,1
lea dx,read_buffer
spot:
	mov ah,3FH
	int 21H
	inc dx
	cmp ax,00
	jnz spot

lea dx,read_buffer
mov ah,09H
int 21H

e:	mov ah,3eH ;to close the file
	int 21h
exit:.exit
end
