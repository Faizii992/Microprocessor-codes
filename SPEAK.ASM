;*****************************************
;*     MDE-8086 EXPERIMENT PROGRAM       *
;*     Chapter 8-5 (Example 1)           *
;*     PROGRAM BY MiDAS ENGINEERING      *
;*****************************************
	;
        ;	FILENAME  : SPEAKER.ASM
        ;	PROCESSOR : I8086
        ;	VER.      : V1.1
        ;
CODE	SEGMENT
	ASSUME	CS:CODE,DS:CODE,ES:CODE,SS:CODE
	;
SPK	EQU	17H
PER	EQU	0CH	;0EH
	;	
	ORG	1000H
L1:	MOV	SI,OFFSET FREQ_TAB
L2:	MOV	DH,BYTE PTR CS:[SI]
	INC	DH
	JZ	L1
	DEC	DH
	;
	MOV	DL,PER
	;
	MOV	AL,0FFH
	;
L3:	OUT	SPK,AL
	MOV	CL,DH
	AND	CX,00FFH
	LOOP	$
	XOR	AL,01H
	DEC	DL
	JNZ	L3
	INC	SI
	JMP	L2
	;
FREQ_TAB:
	DB	25H	;85H
	DB	27H	;7EH
	DB	29H	;77H
	DB	2CH	;70H
	DB	2EH	;6AH
	DB	31H	;64H
	DB	34H	;5EH
	DB	37H	;59H
	DB	3BH	;54H
	DB	3EH	;4FH
	DB	42H	;4AH
	DB	46H	;46H
	DB	4AH	;42H
	DB	4FH	;3EH
	DB	54H	;3BH
	DB	59H	;37H
	DB	5EH	;34H
	DB	64H	;31H
	DB	6AH	;2EH
	DB	70H	;2CH
	DB	77H	;29H
	DB	7EH	;27H
	DB	85H	;25H
	DB	0FFH
	;
	;
CODE	ENDS
	END



