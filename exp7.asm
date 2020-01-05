;*****************************************
;*     MDE-8086 EXPERIMENT PROGRAM       *
;*     Chapter 7-5 (Example 1)           *
;*     PROGRAM BY MiDAS ENGINEERING      *
;*****************************************
	;
        ;	FILENAME  : MATRIX.ASM
        ;	PROCESSOR : I8086
        ;	VER.      : V1.1
        ;
CODE	SEGMENT
	ASSUME	CS:CODE,DS:CODE,ES:CODE,SS:CODE
	;

PPIC_C	EQU	1FH
PPIC	EQU	1DH
PPIB	EQU	1BH
PPIA	EQU	19H
	

	ORG	1000H
	MOV	AL,10000000B
	OUT	PPIC_C,AL

LED:

PPIC_Cc	EQU	1EH ; control register
PPICc	EQU	1CH 
PPIBb	EQU	1AH
PPIAa	EQU	18H
	;	

	MOV	AL,11111111B
	OUT	19h,AL
	;
	MOV	AL,00000000B
	OUT	1dh,AL
	;
L1:	MOV	AL,11110001B
L2:	OUT	1bh,AL
	CALL	TIMER
	SHL	AL,1
	TEST	AL,00010000B
	JNZ	t1
	OR	AL,11110000B
	JMP	L2		
	
	T1:

	MOV	AL,11110000B
	OUT	1bh,AL


	MOV	AL,10000000B
	OUT	PPIC_CC,AL

	;
	MOV	AL,11111111B
	OUT	PPICc,AL
	;
	MOV	AL,11111111B
	OUT	PPIBb,AL
	;
L3:	MOV	AL,11111110B
L4:	OUT	PPIAa,AL
	CALL	TIMER
	STC
	ROL	AL,1
	JC	L4
			
		
	
	MOV	AL,00000000B
	OUT	PPICc,AL

	MOV	AL,10000000B
	OUT	PPIC_C,AL	

	;
	MOV	AL,11110000B
	OUT	1b,AL
	;
	MOV	AL,00000000B
	OUT	1d,AL
	;
L5: 	MOV	SI,OFFSET DATA
L6:	MOV	AL,BYTE PTR CS:[SI]
	CMP	AL,00H
	JE	LED
	OUT	19h,AL
	CALL	TIMER
	INC	SI
	JMP	L6		
	
	;		
TIMER:	MOV	CX,0FFFFH
TIMER1:	NOP
	NOP
	NOP
	NOP
	LOOP	TIMER1
	RET
	;
DATA:	DB	11000000B
	DB	11111001B
	DB	10100100B
	DB	10110000B
	DB	10011001B
	DB	10010010B
	DB	10000010B
	DB	11111000B
	DB	10000000B
	DB	10010000B
	DB	00H


CODE	ENDS
	END



