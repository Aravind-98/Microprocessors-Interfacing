/*** 1)Write an ALP to add two 5 byte data stored at location dat1 & dat2. Now store the result of the addition at location dat2 + 20d. ***/

.MODEL TINY
.DATA

org 00000H ; making  the origin at 00000H
dat1 db 02H,04H,06H,08H,0AH ;defining data1
dat2 db 01H,04H,06H,08H,0AH :defining data2
dummy db 15 dup(?);to induce a gap of 20
result db 5 dup(?);result stored here

.code
.startup

lea si,dat1
lea di,dat2
lea bx,result
clc ;ensuring intially carry flag is 0
mov cx,5d ;essential for the LOOP as it continually decrement it

L1: mov ax,0
    adc ax,[si] ;just to ensure that any previous carry is accounted for
    add ax,[di]
    mov [bx],ax ;storing at result 
    inc si
    inc di
    inc bx ;all pointers incremented by 1
    loop L1 ;5 time loop

.exit

end
