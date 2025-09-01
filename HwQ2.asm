	
.model  small
.stack   100h
.data
a dw -20000,512,31000,1234
N equ 4

numS db  7 dup(' '),'$'

.code
	mov	ax,	@data
	mov	ds,	ax

	mov di,0 ;points to a
	mov cl,0 ;counter
	
	myLoop:
	mov	ax,	a[di]
	mov	bx,	10
	mov	si,	offset numS+5
	
	

next:	
	mov dx,0
	div	bx
	add	dl,	48
	mov	[si],	dl
	dec	si
    cmp	ax,	0
	jne	next
	
	
	
sof:
	inc si
	mov	ah,	9
	mov	dx,	si
	int	21h
	
	
	inc cl
	add di,2
	cmp cl,N
	jne myLoop
	.exit
end
		
	;cmp ax,0
	;jge next
	;neg ax

next:	
	mov dx,0
	div	bx
	add	dl,	48
	mov	[si],	dl
	dec	si
    cmp	ax,	0
	jne	next
	
	
	
sof:
	inc si
	mov	ah,	9
	mov	dx,	si
	int	21h
	
	
	inc cl
	add di,2
	cmp cl,N
	jne myLoop
	.exit
end
	