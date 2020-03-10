/*** Write an ALP that will transfer data from ‘ARRAY1’ to ‘ARRAY2’. The number of elements inthe array is 50. The array is a byte array. The starting address of ARRAY2 = starting address of ARRAY1 + 60d ***/;remove this line

.model tiny
.data
ARRAY1 db 50 dup('A')
waste_space db 10 dup(?); to ensure the offset is proper
ARRAY2 db 50 dup(?)

.code
.startup
mov si,offset ARRAY1
mov di,offset ARRAY2
mov cx,50d
rep movsb

.exit
end

