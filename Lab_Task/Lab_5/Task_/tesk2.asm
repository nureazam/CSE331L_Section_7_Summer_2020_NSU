.MODEL SMALL
.STACK 100H


.DATA
  PROMPT_1 DB 'Enter the BINARY NUM: $'
  PROMPT_2 DB 'GIVEN BINARY NUM IN REV ORDER: $'
  PROMPT_3 DB 'Sum:$'

  
  
  
.CODE
  
  MAIN PROC
    MOV AX, @DATA
    MOV DS,AX
    
    LEA DX, PROMPT_1
    MOV AH, 9
    INT 21H
    
    XOR BL,BL
    
    MOV CX,8
    MOV AH,1
    
 @INPUT:
    INT 21H
    CMP AL, 0DH
    JE @END
    AND AL, OFH
    SHL BL,1
    OR BL,AL
    
  LOOP @INPUT
  
@END:
    MOV AL,BL
    MOV CX,8
    
@LOOP:
    SHL AL,1
    RCR BL,1 
    
@LOOP:
    LEA DX, PROMPT_2
    MOV AH,9
    INT 21H    
    
    MOV CX,8
    MOV AH,2
    
@OUTPUT:
    SHL BL,1
    
  JNC @ZERO
    
    MOV DL, 31H
    JMP @PRINT
    
@ZERO:
    MOV DL, 30H
    
@PRINT:
    INT 21H
LOOP @OUTPUT
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
  END MAIN
   
    
    
    
    

    
    MOV AH, 4CH
    INT 21H
    
 MAIN ENDP
END MAIN