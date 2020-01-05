poooooooooooooo9ooooooooooooooooooooooooooooooooooooooooi;*****************************************
;*     MDE-8086 EXPERIMENT PROGRAM       *
;*     Chapter 7-5 (Example 4)           *
;*     PROGRAM BY MiDAS ENGINEERING      *
;*****************************************
	;
        ;	FILENAME  : MATRIX_3.ASM
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
FONT1:  DB      11111111B
	DB	11111111B
	DB	11111111B
	DB	11111111B
	DB	11111111B
	DB	11111111B
	DB	11111111B
	DB	11111111B
	;
FONT2:  DB      11000000B
        DB      11111111B
	DB	11111111B
	DB	11111111B
	DB	11111111B
	DB	11111111B
	DB	11111111B
	DB	11111111B
	;
FONT3:  DB      10110111B
        DB      11000000B
        DB      11111111B
	DB	11111111B
	DB	11111111B
	DB	11111111B
	DB	11111111B
	DB	11111111B
	;
FONT4:  DB      01110111B
        DB      10110111B
        DB      11000000B
        DB      11111111B
	DB	11111111B
	DB	11111111B
	DB	11111111B
	DB	11111111B
	;
FONT5:  DB      01110111B
        DB      01110111B
        DB      10110111B
        DB      11000000B
        DB      11111111B
	DB	11111111B
	DB	11111111B
	DB	11111111B
	;
FONT6:  DB      10110111B
        DB      01110111B
        DB      01110111B
        DB      10110111B
        DB      11000000B
        DB      11111111B
	DB	11111111B
	DB	11111111B
	;	
FONT7:  DB      11000000B
        DB      10110111B
        DB      01110111B
        DB      01110111B
        DB      10110111B
        DB      11000000B
        DB      11111111B
	DB	11111111B
	;
FONT8:  DB      11111111B
        DB      11000000B
        DB      10110111B
        DB      01110111B
        DB      01110111B
        DB      10110111B
        DB      11000000B
        DB      11111111B

	;
CODE	ENDS
	END

