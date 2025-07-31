; simple.asm - A very simple 8086 assembly program
; This program does nothing but return control to DOS

code segment
          assume cs:code, ds:code
          org    100h                ; COM file starts at offset 100h

    start:
          mov    al, 65              ; First number
          add    al, 2               ; Add second number
          add    al, '0'             ; Convert to ASCII digit
          mov    dl, al              ; Move result to DL for printing
          mov    ah, 02h             ; DOS function: print character
          int    21h                 ; Call DOS interrupt

          mov    ah, 4Ch             ; DOS function: terminate program
          mov    al, 0               ; Return code 0
          int    21h                 ; Call DOS interrupt
code ends
end start
