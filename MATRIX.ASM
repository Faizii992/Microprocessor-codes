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
PPIC_C	EQU	1EH ; control register
PPIC	EQU	1CH 
PPIB	EQU	1AH
PPIA	EQU	18H
	;	
	ORG	1000H
	MOV	AL,10000000B
	OUT	PPIC_C,AL
	;
	MOV	AL,11111111B
	OUT	PPIC,AL
	;
	MOV	AL,11111111B
	OUT	PPIB,AL
	;
L1:	MOV	AL,11111110B
L2:	OUT	PPIA,AL
	CALL	TIMER
	STC
	ROL	AL,1
	JC	L2
	JMP	L1		
	;
	INT	3
	;		
TIMER:	MOV	CX,0FFFFH
TIMER1:	NOP
	NOP
	NOP
	NOP
	LOOP	TIMER1
	RET
	;
CODE	ENDS
	END


