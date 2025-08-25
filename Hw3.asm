.model  small
.stack  100H
.data
A   db   'This a$'
B   db   100 dup('$')
.code
mov ax,@data
mov ds,ax
mov cx,0
mov si, offset A 
myLoop:
mov dl,A[si]
cmp dl, ' '
je plus
cmp A[si], '$'
je sof
inc si
jne myLoop
plus:
inc cx
inc si
jmp myLoop
sof: 
.exit   
end
