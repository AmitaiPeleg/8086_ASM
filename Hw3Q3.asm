
; 8086 Assembly program to sort an array and print each element
.model  small
.stack   100h
.data
a db 1,130,7,1   ; Array of 4 signed bytes
N equ 4                        ; Number of elements in array
b db 10 dup(' '), '$'          ; Buffer for string output (10 spaces + '$' for DOS)
.code
	mov ax, @data              ; Initialize DS
	mov ds,ax
	mov di, 0
	mov si,offset a -1
	
	myLoop:
	inc si
	inc di
	mov al,[si]
	mov bl, [si+1]
	cmp al,bl
	jg gratter
	cmp di,N-1
	je print 
	jmp myLoop
	gratter:
	mov[si], bl
	mov[si+1], al
	cmp di,N-1
	jne myLoop; until here the stage of extange
print:
mov di,0
mov cl,0
myLoop2:
mov al, a[di]
mov bl,10
mov si, offset b+8
next:
mov ah,0
div bl
add ah, 48
mov [si],ah 
dec si
cmp al,0
jne next
;print
	inc si
	mov ah,9
	mov dx,si
	int 21h

	inc cl                     ; CL = CL + 1 (element counter)
	add di,1                   ; DI = DI + 1 (next array element)
	cmp cl,N                   ; If all elements printed, finish
	jne myLoop2                ; Else, continue loop

	.exit                      ; Exit program
end                            ; End of program

