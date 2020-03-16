.model tiny
.data

STRN db 'I am a badd bad man!'
SCNT db 19
STR1 db 'bad'
STRC db 3
RWORD db 'mux'

.code
.startup

LEA DI,STRN
LEA BX,SCNT
MOV CX,[BX]
MOV CH,00
LEA SI,STR1
MOV AL,[SI]
MOV AH,00

L1: REPNE SCASB
    DEC DI
    CALL CMP_STR
    INC DI
    CMP CX,00
    JNZ L1

.exit

CMP_STR PROC NEAR
  PUSH CX
  PUSH DI
  LEA SI,STR1
  LEA BX,STRC
  MOV CL,[BX]
  MOV CH,00
  MOV DX,00

L3:
    INC DX
    CMPSB
    LOOPE L3
  CMP CL,0
  JNZ L2

  CMP BYTE PTR[DI],20h
  JNZ L2

  SUB DI,DX
  LEA SI,RWORD
  MOV CL,[BX]
  REP MOVSB

L2: POP DI
    POP CX
RET
CMP_STR ENDP

end