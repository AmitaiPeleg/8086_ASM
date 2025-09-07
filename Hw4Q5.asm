.model  small
.stack   100h
.data
a db 100,122,123
N equ 3
b db 20,75 ,120,122
N2 equ 4
c db 19 dup(' ')
d db 6 dup(' '),'$'
.code
mov ax,@data
mov ds,ax
mov di,0 ; counter a
mov bl,0 ; counter b
mov si,offset c

myLoop:
mov dl, [b+bx]
cmp a[di],dl
jg nowB
mov dl,a[di]
mov [si] , dl
inc si
inc di
cmp di,N
je justB
jmp myLoop
nowB: 
mov [si],dl
inc si
inc bl
cmp bl,N2
je justA 
jmp myLoop
justA:
mov dl,a[di]
mov[si],dl
inc si
inc di
cmp di,N
je sof
jmp justA
justB:
mov dl, [b+bx]
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
	mov	si,	offset d+4
	
	cmp al,0
	jge next
	neg al

next:	
	mov ah,0
	div	bl
	add	ah,	48
	mov	[si],ah
	dec	si
    cmp	al,	0
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
	mov	al,	b[di]
	mov	bl,	10
	mov	si,	offset d+4
	
	cmp al,0
	jge next2
	neg al

next2:	
	mov ah,0
	div	bl
	add	ah,	48
	mov	[si],ah
	dec	si
    cmp	al,	0
	jne	next2
	
	cmp	b[di],0
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
	mov	al,	c[di]
	mov	bl,	10
	mov	si,	offset d+4
	
	cmp al,0
	jge next3
	neg al

next3:	
	mov ah,0
	div	bl
	add	ah,	48
	mov	[si],ah
	dec	si
    cmp	al,	0
	jne	next3
	
	cmp	c[di],0
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
	
		