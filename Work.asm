.model small
.stack 100h
.data
str1 db 'aaa$'
.code
mov ax,@data
mov ds, ax

push offset str1
call numOfChar
.exit
numOfChar proc near
push bp
mov bp, sp
mov bx,[bp+4]
mov al, 0	; al=result
myLoop:
cmp byte ptr[bx], '$'
je sof
inc al
inc bx
jmp myLoop
sof:
pop bp
ret 2
numOfChar endp
end