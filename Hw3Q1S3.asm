.model  small
.stack  100H
.data
A   db   '     This      is     a          test     $'
B   db   100 dup('$')
.code
mov ax,@data
mov ds,ax
mov si,-1

myLoop:
inc si
mov al, A[si]
mov B[si], al
cmp al,'$'
jne myLoop
mov si, offset B
mov ah ,9
mov dx,si
int 21h
.exit

end
