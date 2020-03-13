.model tiny
.data
filename db 'mup.txt',0
Buffer db 'V.Aravindan 2017B4A70849P',0DH,0AH,'V.Aravindan 2017B4A70849P'
filehandle dw ?

.code
.startup

lea dx,filename
mov ah,3cH
mov cx,00H
int 21H; if succesful the file handle enters the AX register (carry flag denotes if success or failure)
JC exit
mov filehandle,ax

lea dx,Buffer
mov bx,filehandle
mov cx,52
mov ah,40H
int 21H

mov ah,3eH ;to close the file
int 21h

exit: .exit
end
