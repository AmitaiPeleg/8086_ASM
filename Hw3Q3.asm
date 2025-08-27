.model  small
.stack   100h
.data
a db 100,124,-123,167
N equ 4
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
.exit
end 
	
		