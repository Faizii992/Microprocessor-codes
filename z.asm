;*****************************************
;*     MDE-8086 EXPERIMENT PROGRAM       *
;*     Chapter 7-5 (Example 5)           *
;*     PROGRAM BY MiDAS ENGINEERING      *
;*****************************************
	;
        ;	FILENAME  : MATRIX_4.ASM
        ;	PROCESSOR : I8086
        ;	VER.      : V1.1
        ;
CODE	SEGMENT
	ASSUME	CS:CODE,DS:CODE,ES:CODE,SS:CODE
	;
PPIC_C	EQU	1EH ; control register
PPIC	EQU	1CH ; c port
PPIB	EQU	1AH
PPIA	EQU	18H
	;	
	ORG	1000H
	MOV	AL,10000000B
	OUT	PPIC_C,AL
	;
	MOV	AL,11111111B
	OUT	PPIA,AL
	;
L1:	MOV	SI,OFFSET FONT1
	;
	MOV	BL,8  ; font No.
L3:	MOV	BH,50 ; display time
	;
L2:	PUSH	SI
	CALL	SCAN
	POP	SI
	DEC	BH
	JNZ	L2
	;
	ADD	SI,8
	DEC	BL
	
	JNZ	L3
        ;
	JMP	L1
	;
	;	
	;
SCAN    PROC	NEAR
	MOV	AH,00000001B
SCAN1:	MOV	AL,BYTE PTR CS:[SI]
	OUT	PPIB,AL
	;		
	MOV	AL,AH
	OUT	PPIC,AL
	CALL	TIMER
	INC	SI
	CLC
	ROL	AH,1
	JNC	SCAN1
	RET
SCAN	ENDP
	;
TIMER:	MOV	CX,300
TIMER1:	NOP
	NOP
	NOP
	NOP
	LOOP	TIMER1
	RET
	;

         
                               
FONT1:
DB 11111111DB
DB 01111111DB
DB 11111111DB    
DB 11111111DB 
DB 11111111DB    
DB 11111111DB 
DB 11111111DB    
DB 11111111DB 

FONT1:
DB 01101111DB
DB 01111111DB
DB 11111111DB    
DB 11111111DB 
DB 11111111DB    
DB 11111111DB 
DB 11111111DB    
DB 11111111DB 


FONT2:
DB 01101111DB  
DB 01101111DB
DB 01111111DB
DB 11111111DB    
DB 11111111DB 
DB 11111111DB    
DB 11111111DB 
DB 11111111DB    
                 
                 
FONT3:   
DB 00000000DB 
DB 01101111DB  
DB 01101111DB
DB 01111111DB
DB 11111111DB    
DB 11111111DB 
DB 11111111DB    
DB 11111111DB   

                 
                 
FONT3:
DB 11111111DB   
DB 00000000DB 
DB 01101111DB  
DB 01101111DB
DB 01111111DB
DB 11111111DB    
DB 11111111DB 
DB 11111111DB    
 
   
                 
FONT4:    
DB 11111111DB     
DB 11111111DB   
DB 00000000DB 
DB 01101111DB  
DB 01101111DB
DB 01111111DB
DB 11111111DB    
DB 11111111DB 

   
                 
FONT4:
DB 11111111DB   
DB 11111111DB     
DB 11111111DB   
DB 00000000DB 
DB 01101111DB  
DB 01101111DB
DB 01111111DB    
DB 11111111DB       


FONT4: 
DB 11111111DB 
DB 11111111DB   
DB 11111111DB     
DB 11111111DB   
DB 00000000DB 
DB 01101111DB  
DB 01101111DB
DB 01111111DB    
      

FONT4:
DB 11111111DB  
DB 11111111DB 
DB 11111111DB   
DB 11111111DB     
DB 11111111DB   
DB 00000000DB 
DB 01101111DB  
DB 01101111DB
   


FONT4: 
DB 11111111DB
DB 11111111DB  
DB 11111111DB 
DB 11111111DB   
DB 11111111DB     
DB 11111111DB   
DB 00000000DB 
DB 01101111DB  

   
FONT4:   
DB 11111111DB
DB 11111111DB
DB 11111111DB  
DB 11111111DB 
DB 11111111DB   
DB 11111111DB     
DB 11111111DB   
DB 00000000DB 
  

FONT4:   
DB 00000000DB 
DB 11111111DB
DB 11111111DB
DB 11111111DB  
DB 11111111DB 
DB 11111111DB   
DB 11111111DB     
DB 11111111DB   

  
  
            
      
	;           

	;                 
	;
CODE	ENDS
	END

		
