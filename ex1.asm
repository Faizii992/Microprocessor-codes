;*****************************************
;*     MDE-8086 EXPERIMENT PROGRAM       *
;*     Chapter 7-5 (Example 3)           *
;*     PROGRAM BY MiDAS ENGINEERING      *
;*****************************************
	;
        ;	FILENAME  : MATRIX_2.ASM
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
	
	;
L1:	MOV	SI,OFFSET FONT
	;
	MOV	AH,00000001B
	;
L2:	MOV	AL,BYTE PTR CS:[SI]

OUT	PPIB,AL
;CMP AL,00000000b
;JE GREEN1

	

	;
NOT AL
OUT PPIA,AL		
	MOV	AL,AH
	OUT	PPIC,AL
	CALL	TIMER
	INC	SI
	CLC
	ROL	AH,1
	JNC	L2
	JMP	green		
	;
	INT	3
	;		
TIMER:	MOV	CX,300
TIMER1:	NOP
	NOP
	NOP
	NOP
	LOOP	TIMER1
	RET
	;
FONT:   DB      11111111B
        DB      11111111B
        DB      10111101B
        DB      01111110B
        DB      01100110B
        DB      10011001B
        DB      11111111B
        DB      11111111B
DB 00000000B

;


	;		
TIMER2:	MOV	CX,FFFFh
TIMER3:	NOP
	NOP
	NOP
	NOP
	LOOP	TIMER3
	RET


	
GREEN: 

MOV AL,11111111b
OUT PPIC,AL

MOV Al,11111111B
out PPIB,al
NOT AL
OUT PPIA,AL



CALL TIMER2


jmp l1






CODE	ENDS
	END


