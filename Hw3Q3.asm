.model  small
.stack   100h
.data
a db 100,124,-123,167
N equ 4
b db 10 dup(' '), '$'
.code
mov di,-1
mov si,offset a
dec si
myLoop:
inc si 
inc di
mov al, [si]
cmp al,[si+1]
jg bigger
cmp di,N-1
je sof
 jmp myLoop


bigger:
mov bl, [si+1]
mov[si],bl
mov[si+1],al
cmp di,N-1
je sof
jmp myLoop
sof:

    mov di,0 ;points to a
	mov cl,0 ;counter
	
	myLoop2:
	mov	al,	a[di]
	mov	bl,	10
	mov	si,	offset b+8
	
	cmp al,0
	jge next
	neg al

next:	
	mov dx,0
	div	bx
	add	dl,	48
	mov	[si],	dl
	dec	si
    cmp	ax,	0
	jne	next
	
	cmp	a[di],0
	jge	sof2
	mov	byte ptr[si],	'-'
	dec si
	
sof2:
	inc si
	mov	ah,	9
	mov	dx,	si
	int	21h
	
	
	inc cl
	add di,1
	cmp cl,N
	jne myLoop2

.exit
end 
	
		