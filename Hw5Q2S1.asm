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
    

    .exit

sumSign proc near
    push bp
    mov bp, sp
    mov ax , [bp+4]
    add ax,[bp+6]
    mov al,ah
    pop bp
      ret 4
	sumSign endp
  
end