.model tiny

.data
filename db 'mup.txt',0 ;ascii-z terminated
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
mov ah,3FH
mov cx,68
lea dx,read_buffer
int 21H

JC e
mov ah,09H
int 21H

e:	mov ah,3eH ;to close the file
	int 21h
exit:.exit
end
