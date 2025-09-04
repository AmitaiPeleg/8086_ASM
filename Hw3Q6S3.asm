    .model small
    .stack 100h
    .data
    a dw 100,50 , 65 ,5
    N equ 4
    sum dw ?
    .code
    mov ax,@data
    mov ds, ax
    mov si ,0  ; counter for a
    mov cx,0
    mov dl,0 ; counter for the loop
    myLoop:
    inc dl
    mov ax, [a+si]
    add cx,ax
    add si,2
    cmp dl,N
    jne myLoop
    mov sum,cx

    .exit
    end