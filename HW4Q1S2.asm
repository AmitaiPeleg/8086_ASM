.model  small
.stack  100H
.data
A   db   'Ts  a$'
B   db   100 dup('$')
.code
mov ax,@data
mov ds,ax
mov cx,0
mov si,-1
mov bl,1 ; if bl is 1 the meaning is that the previous char was ' '
myLoop:
inc si
mov dl,A[si]
cmp dl, ' '
je plus
cmp A[si], '$'
je sof
mov bl,0
jmp myLoop
plus:
cmp bl,1
je myLoop
inc cx
mov bl,1
jmp myLoop
sof: 
inc cx
.exit   
end
