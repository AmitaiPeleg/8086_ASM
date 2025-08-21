.model small
.stack 100h
.data 
num dw 111
.code
mov ax,@data
mov ds,ax
mov cx,0   ; counter
mov ax, num 
mov bx, 10
myLoop:
mov dx,0
div bx
Add cx,dx 
cmp ax,0
jne myLoop
.exit
end


