;*****************************************
;*     MDE-8086 EXPERIMENT PROGRAM       *
;*     Chapter 12-4 (Example 1)          *
;*     PROGRAM BY MiDAS ENGINEERING      *
;*****************************************
	;
        ;	FILENAME  : STEPMO.ASM
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
	;	
	ORG	1000H
	;
	MOV	AX,0
	MOV	DS,AX
	;
	MOV	AL,10000000B
	OUT	PPIC_C,AL
	;
	MOV	AL,11111111B
	OUT	PPIA,AL
	MOV	AL,00000000B
	OUT	PPIC,AL
	;
	MOV	AL,11101110B
L1:	OUT	PPIB,AL
	CALL	TIMER
	ROL	AL,1
	JMP	L1		
	;
TIMER: 	MOV	CX,0
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