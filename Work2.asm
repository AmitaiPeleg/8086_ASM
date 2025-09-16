.model small
.stack 100h
.data
num db 120, 121, 2 
N equ 3
.code
    mov ax, @data
    mov ds, ax

    push offset num   
    push N           
    call max         
    
   .exit

sum proc near          
    push bp
    mov bp, sp
  
    
    mov ax, [bp+4]     
    mov cx, 0          
    
myLoop1:
    mov dx, 0
    mov bx, 10
    div bx            
    add cx, dx        
    cmp ax, 0         
    jne myLoop1       
    
    mov ax, cx        
    
   
    pop bp
    ret 2
sum endp

max proc near          
    push bp
    mov bp, sp  
    mov si, [bp+6]     
    mov cx, [bp+4]     
    mov bl, 0          
    
myLoop:
    cmp cx, 0          
    je sof
    
    mov al, [si]
    mov ah, 0
    
    push ax            
    call sum           
    
    cmp al, bl
    jbe skip    
    mov bl, al         
    
skip:
    inc si             
    dec cx             
    jmp myLoop
    
sof:
    mov al, bl         
    pop bp
    ret 4 
max endp
end 