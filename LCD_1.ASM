;*****************************************
;*     MDE-8086 EXPERIMENT PROGRAM       *
;*     Chapter 10-4 (Example 2)          *
;*     PROGRAM BY MiDAS ENGINEERING      *
;*****************************************
	;
        ;	FILENAME  : LCD_1.ASM
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
L2:	CALL	ALLCLR
	;
	MOV	SI,OFFSET CUSOR1
	CALL	STRING
	;
	CALL	LN21
	MOV	SI,OFFSET CUSOR2
	CALL	STRING
	;
	MOV	DL,16
L1:	CALL	TIMER
	CALL	SHIFT
	CALL	TIMER
	DEC	DL
	JNZ	L1
	JMP	L2
	;
CUSOR1	DB	'Serial monitor !',00H
CUSOR2  DB	'Very very Good !',00H
	;
	; LCD instruction
ALLCLR:	MOV	AH,01H
	JMP	LNXX
	;
SHIFT:	MOV	AH,00011100B
	JMP	LNXX
	;
LN21:	MOV	AH,0C0H
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
	JMP	STRING
STRING1:
  	RET
	;		
TIMER:	MOV	CX,2
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