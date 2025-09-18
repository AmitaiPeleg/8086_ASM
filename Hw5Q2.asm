.model  small
.stack   100h
.data
A   dw   12, 2
B   dw    -2, 2
C   dw     2   dup (?)
N equ 2

.code
	mov	ax,	@data
	mov	ds,	ax
    
push offset A
push offset B
push offset C
push N
call sumArray
mov si,0
mov ax,N
shl ax,1
printLoop:
cmp si,ax
jge sof1
push si
push ax
push  C[si]
call print
mov dl,' '
mov ah,2
int 21h
pop ax
pop si
add si,2
jmp printLoop
sof1:
    .exit

sumSign proc near
    push bp
    mov bp, sp
    mov ax , [bp+4]
    add ax,[bp+6]
    pop bp
      ret 4
	sumSign endp

  sumArray proc near
    push bp
    mov bp, sp

    mov bx, [bp+10] ;first array
    mov si, [bp+8]  ; second array
    mov di, [bp+6]  ; last array
    mov cx, [bp+4]  ; size

myLoop:
    cmp cx, 0
    je sof

    mov ax, [bx]
    mov dx, [si]

    push ax
    push dx
    call sumSign
    mov [di], ax

    add bx, 2
    add si, 2
    add di, 2
    dec cx
    jmp myLoop
sof:
    pop bp
    ret 8
sumArray endp

print proc near
    push bp
    mov bp, sp
	mov	bx,	10
    mov ax , [bp+4]
    mov si ,ax
	mov	cx,	0
	
	cmp ax,0 
	jge next
	neg ax

next:	
    mov dx,0
	div	bx
	add	dx,	30h
	push dx
	inc	cx
    cmp	ax,	0
	jne	next
	
	cmp	si,0
	jge	sof2
	push       '-'
	inc	cx
sof2:
	cmp cx,0
	jz  ext
	pop	dx
	mov	ah,2
	int	21h
	dec	cx
	jmp sof2
ext:
pop bp
ret 2
	print endp
end