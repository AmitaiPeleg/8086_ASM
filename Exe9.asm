.model small
.stack 100h
.data
num dw 1 ,10,3
N equ 3
.code
mov ax,@data
mov ds, ax
push offset num
push N
call max
.exit
sum proc near
push bp
mov bp, sp
mov ax, [bp+4]
mov cx, 0
myLoop1:
mov dx, 0
mov bx, 10
div bx
add cx, dx
cmp ax, 0
jne myLoop1
mov ax, cx
pop bp
ret 2
sum endp

max proc near
push bp
mov bp,sp
mov si,[bp+4] ; offset
mov bl,0

myLoop:
mov dx,[bp+6]
dec dx
cmp dx,0
je sof
mov [bp+6], dx
call sum
cmp al,bl
jb myLoop
mov bl,al
jmp myLoop
sof:
mov al,bl
pop bp
ret 4
end