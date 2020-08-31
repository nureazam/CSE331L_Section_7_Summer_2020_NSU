.MODEL SMALL
 .STACK 100H

 .DATA
   PROMPT_1  DB  'Enter the binary value:  $'
   PROMPT_2  DB  0DH,0AH,'SHR by 4 bits: $'

 .CODE
   MAIN PROC
     MOV AX, @DATA                  
     MOV DS, AX

     LEA DX, PROMPT_1                
     MOV AH, 9
     INT 21H

     XOR BX, BX                    
     MOV CX, 16                   
     MOV AH, 1                    

     @INPUT:                       
       INT 21H                    
       CMP AL, 0DH                 
       JE @END                    
       AND AL, 0FH                
       SHL BX, 1                 
       OR BL, AL                  
     LOOP @INPUT                  

     @END:                        

     LEA DX, PROMPT_2               
     MOV AH, 9
     INT 21H

     MOV CX, 4                   
     MOV AH, 2                    

     @OUTPUT:                     
       SHR BX, 1                  

       JNC @ZERO                  
         MOV DL, 31H              
         JMP @DISPLAY            

       @ZERO:                     
         MOV DL, 30H              

       @DISPLAY:                  
         INT 21H                 
     LOOP @OUTPUT                

     MOV AH, 4CH                  
     INT 21H
   MAIN ENDP
 END MAIN