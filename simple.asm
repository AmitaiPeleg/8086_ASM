; simple.asm - A very simple 8086 assembly program
; This program does nothing but return control to DOS

code segment
          assume cs:code, ds:code
          org    100h                ; COM file starts at offset 100h

    start:
          
code ends
end start
