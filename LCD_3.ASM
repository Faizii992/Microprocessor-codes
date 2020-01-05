;*****************************************
;*     MDE-8086 EXPERIMENT PROGRAM       *
;*     Chapter 10-4 (Example 4)          *
;*     PROGRAM BY MiDAS ENGINEERING      *
;*****************************************
	;
        ;	FILENAME  : LCD_3.ASM
        ;	PROCESSOR : I8086
        ;	VER.      : V1.1
        ;
CODE	SEGMENT
	ASSUME	CS:CODE,DS:CODE,ES:CODE,SS:CODE
	;
	;
STACK	EQU	0540H
	;
KEY	EQU	01H
LCDC	EQU	00H
LCDC_S	EQU	02H
LCDD	EQU	04H
	;	
	ORG	1000H
	;
	XOR	AX,AX
	MOV	DS,AX
	MOV	SS,AX
	MOV	SP,STACK
	;
	CALL	FUNSET
	CALL	ALLCLR
	;
	MOV	SI,OFFSET DATA
	CALL	STRING
	;
L1:	CALL	LN2C
	;
	CALL	SCAN
	MOV	AH,BYTE PTR K_BUF
	AND	AH,00011111B
	CALL	H_A
	JMP	L1
	;
DATA	DB	'       Key Code',00H
	;
	; LCD instruction
ALLCLR:	MOV	AH,01H
	JMP	LNXX
	;
LN2C:   MOV	AH,0C8H
	JMP	LNXX
	;
FUNSET:	MOV	AH,0EH
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
	; 1 byte data LCD out
	; INPUT DATA AH
H_A     PROC	NEAR
	PUSH	AX
	ROR	AH,1
	ROR	AH,1
	ROR	AH,1
	ROR	AH,1
	CALL	H_A1 ; high digit lcd out
	POP	AX
	CALL	H_A1 ; low digit lcd out
	RET
H_A	ENDP
	;				
H_A1    PROC	NEAR
	PUSH	BX
	MOV	BX,OFFSET ASCTBL
	AND	AH,0FH
	ADD	BL,AH
	JNC	H_A2
	INC	BH
H_A2:	MOV 	AH,CS:[BX]
	CALL	CHAROUT
	POP	BX
	RET
	;
ASCTBL	DB	'0123456789ABCDEF'
H_A1	ENDP
	;
	; key board scan, key code = AL
SCAN    PROC	NEAR
	IN	AL,KEY
	TEST	AL,10000000B
	JNZ	SCAN
	;
	AND	AL,00011111B
	MOV	BYTE PTR K_BUF,AL
	; key clear
	OUT	KEY,AL
	RET
SCAN	ENDP
	;	
K_BUF:	DB	1
	;
CODE	ENDS
	END



