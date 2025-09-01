.model  small
.stack   100h
.data
a db 100,122,123
N equ 3
b db 20,75 ,130,140,
N2 equ 4
c db 19 dup(' ')
d db 4 dup(' '),'$'
.code
mov ax,@data
mov ds,ax
mov al,0 ; counter a
mov bl,0 ; counter b
mov si,offset c
myLoop:
mov dl, b[bl]
cmp a[al],dl
jl nowB
mov dl,a[al]
mov [si] , dl
inc si
inc al
cmp al,N
je justB
jmp myLoop
nowB: 
mov[si],dl
inc si
inc bl
cmp bl,N2
je justA 
jmp myLoop
justA:
mov dl,a[al]
mov[si],dl
inc si
inc al
cmp al,N
je sof
jmp justA
justB:
mov dl, b[bl]
mov[si],dl
inc si
inc bl
cmp bl,N2
je sof
jmp justB
sof:
 mov di,0 ;points to a
	mov cl,0 ;counter
	
	myLoop2:
	mov	al,	a[di]
	mov	bl,	10
	mov	si,	offset d+2
	
	cmp al,0
	jge next
	neg al

next:	
	mov dx,0
	div	bx
	add	dl,	48
	mov	[si],dl
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

     mov di,0 ;points to a
	mov cl,0 ;counter
	
	myLoop3:
	mov	al,	a[di]
	mov	bl,	10
	mov	si,	offset d+2
	
	cmp al,0
	jge next2
	neg al

next2:	
	mov dx,0
	div	bx
	add	dl,	48
	mov	[si],	dl
	dec	si
    cmp	ax,	0
	jne	next2
	
	cmp	a[di],0
	jge	sof3
	mov	byte ptr[si],	'-'
	dec si
	
sof3:
	inc si
	mov	ah,	9
	mov	dx,	si
	int	21h
	
	
	inc cl
	add di,1
	cmp cl,N2
	jne myLoop3

     mov di,0 ;points to a
	mov cl,0 ;counter
	
	myLoop4:
	mov	al,	a[di]
	mov	bl,	10
	mov	si,	offset d+2
	
	cmp al,0
	jge next3
	neg al

next3:	
	mov dx,0
	div	bx
	add	dl,	48
	mov	[si],	dl
	dec	si
    cmp	ax,	0
	jne	next3
	
	cmp	a[di],0
	jge	sof4
	mov	byte ptr[si],	'-'
	dec si
	
sof4:
	inc si
	mov	ah,	9
	mov	dx,	si
	int	21h
	
	
	inc cl
	add di,1
	cmp cl,N2+N
	jne myLoop4
.exit
end 
	
		