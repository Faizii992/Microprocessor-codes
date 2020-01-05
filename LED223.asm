;*****************************************
;*     MDE-8086 EXPERIMENT PROGRAM       *
;*     Chapter 7-4 (Example 1)           *
;*     PROGRAM BY MiDAS ENGINEERING      *
;*****************************************
	;
        ;	FILENAME  : LED.ASM
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
	MOV	AL,10000000B
	OUT	PPIC_C,AL
	;
	MOV	AL,11111111B
	OUT	PPIA,AL
	;
	MOV	AL,00000000B
	OUT	PPIC,AL
	;

L2: 	MOV	SI,OFFSET DATA
L1:	MOV	AL,BYTE PTR CS:[SI]
	CMP	AL,00h
	JE	L2
	OUT	PPIB,AL

	CALL	TIMER
	INC	SI
	JMP	L1		
	;
	INT	3
	;		
TIMER:	MOV	CX,0
TIMER1:	NOP
	NOP
	NOP
	NOP
NOP
	NOP
	NOP


	LOOP	TIMER1
	RET
	;
DATA:	DB	11110010B
	DB	11110001B
	DB	11111000B
	DB	11110100B
	db 	00h


CODE	ENDS
	END


