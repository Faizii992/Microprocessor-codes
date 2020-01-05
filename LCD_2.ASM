;*****************************************
;*     MDE-8086 EXPERIMENT PROGRAM       *
;*     Chapter 10-4 (Example 3)          *
;*     PROGRAM BY MiDAS ENGINEERING      *
;*****************************************
	;
        ;	FILENAME  : LCD_2.ASM
        ;	PROCESSOR : I8086
        ;	VER.      : V1.1
        ;
CODE	SEGMENT
	ASSUME	CS:CODE,DS:CODE,ES:CODE,SS:CODE
	;
	;
STACK	EQU	0540H
	;
LCDC	EQU	00H
LCDC_S	EQU	02H
LCDD	EQU	04H
	;	
	ORG	1000H
	;
	XOR	AX,AX
	MOV	SS,AX
	MOV	SP,STACK
	;
	CALL	ALLCLR
	;
	CALL	ENTMODE
L1:	CALL	CUSOR1
	MOV	SI,OFFSET DATA
	CALL	STRING
	JMP	L1
	;
DATA	DB	'8086 Training Kit Good !',00H
	;
	; LCD instruction
ALLCLR:	MOV	AH,01H
	JMP	LNXX
	;
ENTMODE:
        MOV	AH,00000111B
	JMP	LNXX
	;
CUSOR1:	MOV	AH,90H
	;
LNXX:	CALL	BUSY
	MOV	AL,AH
	OUT	LCDC,AL
	RET
	; busy flag check
BUSY:	IN	AL,LCDC_S
	AND	AL,10000000B
	JNZ	BUSY
	RET
	;
	; 1 char. LCD OUT 
	; AH = out data
CHAROUT:
	CALL	BUSY
	;
	MOV	AL,AH
	OUT	LCDD,AL
	RET
	;
STRING:	MOV	AH,BYTE PTR CS:[SI]
	CMP	AH,00H
	JE	STRING1
	; out
	CALL	BUSY
	CALL	CHAROUT
	INC	SI
	CALL	TIMER
	JMP	STRING
STRING1:
  	RET
	;		
TIMER:	MOV	CX,1
TIMER2:	PUSH	CX
       	MOV	CX,0
TIMER1:	NOP
	NOP
	NOP
	NOP
	LOOP	TIMER1
	POP	CX
	LOOP	TIMER2
	RET
	;
CODE	ENDS
	END




