; append hostel name and room number
.model tiny
.386
.data
filename db 'mup.txt',0
filehandle dw ?
write_buffer db 0AH,'RAM-BHAVAN 1178'

.code
.startup
; first step is to open the file in r/w mode
mov ah,3DH
lea dx,filename
mov al,02H
int 21H

JC exit ;if error in opening then exit the program

mov filehandle,ax ;else load the filehandle in the memory and proceed

mov bx,filehandle
mov ah,42H
mov al,02H ;takes the fptr to the end of the file for appending
mov dx,00
mov cx,00
int 21H ;by now the fptr is at the eof...now write

mov ah,40H
mov cx,16
lea dx,write_buffer
int 21H
JC exit

mov ah,3eH ;to close the file
int 21h

exit:.exit
end
