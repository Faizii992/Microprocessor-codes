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
	
	;
L1:	MOV	SI,OFFSET FONT1
	;
	MOV	BL,16  ; font No.
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

	NOT 	AL
	OUT	PPIA,AL
		
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

	;
FONT1:  DB      11111111B
        DB      11111111B
	DB	11111111B
	DB	01111111B
        DB      01111111B
	DB	11111111B
        DB      11111111B
	DB	11111111B
	;
FONT2:  DB      11111111B
        DB      11111111B
        DB      01111111B
	DB	10111111B
	DB	10111111B
        DB      01111111B
        DB      11111111B
	DB	11111111B
	;
FONT3:  DB      11111111B
        DB      11111111B
        DB      10111111B
        DB      11011111B
        DB      11011111B
        DB      00111111B
        DB      11111111B
	DB	11111111B
	;
FONT4:  DB      11111111B
        DB      11111111B
        DB      11011111B
        DB      11101111B
        DB      01101111B
        DB      10011111B
        DB      11111111B
        DB      11111111B
	;
	
FONT5:  DB      11111111B
        DB      11111111B
        DB      11101111B
        DB      11110111B
        DB      00110111B
        DB      11001111B
        DB      11111111B
        DB      11111111B
	;
FONT6:  DB      11111111B
        DB      11111111B
        DB      11110111B
        DB      11111011B
        DB      10011011B
        DB      01100111B
        DB      11111111B
        DB      11111111B

	;


FONT7:  DB      11111111B
        DB      11111111B
        DB      01111011B
        DB      11111101B
        DB      11001101B
        DB      00110011B
        DB      11111111B
        DB      11111111B
	;
FONT8:  DB      11111111B
        DB      11111111B
        DB      10111101B
        DB      01111110B
        DB      01100110B
        DB      10011001B
        DB      11111111B
        DB      11111111B



	;

FONT9:  DB      11111111B
        DB      11111111B
        DB      11011110B
        DB      10111111B
        DB      10110011B
        DB      11001100B
        DB      11111111B
        DB      11111111B
	;
FONT10: DB      11111111B
        DB      11111111B
        DB      11101111B
        DB      11011111B
        DB      11011001B
        DB      11100110B
        DB      11111111B
        DB      11111111B
	;
FONT11: DB      11111111B
        DB      11111111B
        DB      11110111B
        DB      11101111B
        DB      11101100B
        DB      11110011B
        DB      11111111B
        DB      11111111B
	;
FONT12: DB      11111111B
        DB      11111111B
        DB      11111011B
        DB      11110111B
        DB      11110110B
        DB      11111001B
        DB      11111111B
        DB      11111111B
	;
	;
	
FONT13: DB      11111111B
        DB      11111111B
        DB      11111101B
        DB      11111011B
        DB      11111011B
        DB      11111100B
        DB      11111111B
        DB      11111111B
	;
	;
FONT14: DB      11111111B
        DB      11111111B
        DB      11111110B
        DB      11111101B
        DB      11111101B
        DB      11111110B
        DB      11111111B
        DB      11111111B

	;


FONT15: DB      11111111B
        DB      11111111B
        DB      11111111B
        DB      11111110B
        DB      11111110B
        DB      11111111B
        DB      11111111B
        DB      11111111B
	;
FONT16: DB      11111111B
        DB      11111111B
        DB      11111111B
        DB      11111111B
        DB      11111111B
        DB      11111111B
        DB      11111111B
        DB      11111111B


CODE	ENDS
	END

		
