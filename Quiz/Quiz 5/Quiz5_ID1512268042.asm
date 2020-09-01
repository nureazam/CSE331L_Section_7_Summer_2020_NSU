INCLUDE  'EMU8086.INC'
.model small
.stack 100h
.data
msg1 db " The number is : X $"
msg2 db " The number is : X` or not x$"
.code
main proc 
    
    mov ax,@data
    mov ds,ax
    
    
    printn "Enter an integer less than 9: "
    
    mov dl, '5'
    mov ah, 1
    int 21h
    cmp al, dl
    je l1
    
    mov dx, offset msg2
    mov ah, 9
    int 21h
    
    mov ah, 4ch
    int 21h
    
    
    
    l1:
    mov  dx, offset msg1
    mov ah, 9
    int 21h
    
    mov ah, 4ch
    int 21h
    
    main endp
end main