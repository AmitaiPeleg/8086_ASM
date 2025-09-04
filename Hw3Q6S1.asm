    .model small
    .stack 100h
    .data
    a db 100,50 , 65 ,5
    N equ 4
    sum db ?
    .code
    mov ax,@data
    mov ds, ax
    mov si ,0  ; counter for a
    mov cl,0
    mov dl,0 ; counter for the loop
    myLoop:
    inc dl
    mov al, [a+si]
    add cl,al
    inc si
    cmp dl,N
    jne myLoop
    mov sum,cl

    .exit
    end