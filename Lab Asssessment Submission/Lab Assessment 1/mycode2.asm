
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

MOV AX, FFH
MOV FFH, AX
MOV AX,BX
MOV AX,2
MOV FFH,02

ret




