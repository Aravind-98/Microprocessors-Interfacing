.model tiny
.386
.data
ORG 00000H
cnt1 db 09,00
dat1 db 'math','have','    ','bury','dine','    ','hell','deep','tree'

.code
.startup

lea DI,dat1; di gets address of data
lea SI,cnt1
mov CX,[si]

mov EAX,20202020H
mov DX,0000H

L4: CMP [di],EAX ; if zero simply complement the dl and proceed
    JNZ L7
    XOR DL,01H; if we have indeed found '____' then flip dl
    JMP L5
L7: CMP DL,01H; if dl is indeed 00H then no issues just go on, else call swap
    JNZ L5
    CALL SWAP
L5: add DI,4
    LOOP L4
.exit

SWAP PROC NEAR ;NOTE THAT only 16-bit and 32-bit values can be pushed
    MOV BX,[DI]
    ROR BX,8
    PUSH BX ; so essentially I am swapping the low and high order bytes of half the word and then pushing it. Please give thought to why a 32-bit push+pop won't work
    MOV BX,[DI+2]
    ROR BX,8
    PUSH BX
    POP DWORD PTR[DI]
    RET
SWAP ENDP

end
