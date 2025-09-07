.model  small                  ; Define memory model as small

.stack  100h                   ; Set stack size to 256 bytes
 
.data
    a db 100,124,233,167           ; Array 'a' with 4 elements
    N equ 4                        ; Constant N = 4 (number of elements)
    b db 10 dup(' '), '$'          ; Buffer 'b' for output (10 spaces + '$' for string end)

.code
    mov ax,@data                   ; Initialize DS register
    mov ds,ax

    mov di,0                   ; DI = -1 (will be incremented at loop start)
    mov si,offset a                ; SI points to start of array 'a'
    dec si                         ; SI = SI - 1 (so first inc si points to a[0])

; --- Bubble sort (one pass) ---
myLoop:
    inc si                         ; SI = SI + 1
    inc di                         ; DI = DI + 1 (element index)
    mov al, [si]                   ; AL = a[DI]
    cmp al,[si+1]                  ; Compare a[DI] with a[DI+1]
    ja bigger                      ; If a[DI] > a[DI+1], swap
    cmp di,N-1                     ; If at last element, finish
    je sof
    jmp myLoop                    ; Else, continue loop

bigger:
    mov bl, [si+1]                 ; BL = a[DI+1]
    mov[si],bl                     ; a[DI] = a[DI+1]
    mov[si+1],al                   ; a[DI+1] = AL (original a[DI])
    cmp di,N-1                     ; If at last element, finish
    je sof
    jmp myLoop                     ; Else, continue loop

sof:
	mov di,0                   ; DI = 0 (reset for output)
	mov cl,0                   ; CL = 0 (counter for output)

; --- Output sorted array ---
myLoop2:
    mov ah,0 ; clear for the Ascii 
	mov al, a[di]              ; AL = a[DI] (get element)
	mov bl, 10                 ; BL = 10 (for division, to get digits)
	mov si, offset b+8         ; SI points to end of buffer (for right-align digits)

next:
	mov dx,0                   ; Clear DX before division
	div bx                     ; AX / BX, quotient in AL, remainder in DL
	add dl, 48                 ; Convert remainder to ASCII
	mov [si],dl                ; Store ASCII digit in buffer
	dec si                     ; Move to next position (left)
	cmp ax, 0                  ; If quotient is not zero, continue
	jne next

	; print
	inc si                     ; SI points to first digit
	mov ah, 9                  ; DOS print string function
	mov dx, si                 ; DX = address of string
	int 21h                    ; Print string

	inc cl                     ; CL = CL + 1 (element counter)
	add di,1                   ; DI = DI + 1 (next array element)
	cmp cl,N                   ; If all elements printed, finish
	jne myLoop2                ; Else, continue loop

.exit                          ; Exit program
end                            ; End of program
