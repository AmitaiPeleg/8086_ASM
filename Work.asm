.model small
.stack 100h
.data
a db 1, 2, 3, 2
N equ 4

.code
mov ax,@data
mov ds, ax

push offset a
push n
call maxArray
.exit
maxArray proc near
push bp
mov bp, sp
mov si, [bp+6]
mov cx, [bp+4]

cmp cx, 0
jne rec
mov ax, 0
jmp sof

rec:
push si
inc si
push si
dec cx
push cx

call maxArray
pop si
cmp al, [si]
jg sof
mov al,[si]
sof:
pop bp
ret 4
maxArray endp
end