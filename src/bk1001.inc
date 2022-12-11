;;; Copyright (c) 2021-2022 Ufasoft  http://ufasoft.com  mailto:support@ufasoft.com,  Sergey Pavlov  mailto:dev@ufasoft.com
;;;
;;; SPDX-License-Identifier: MIT

;;; BK-0010.01 Specific Addresses and macros


.INCLUDE /k1801.inc/
.INCLUDE /bkkeys.inc/


$EXTM	= 42		; Extended memory mode byte; Values: 0, 377 allow to switch on/off, any other value disables to switch off
$TSTKEY	= 105		; flag oi pressed key
$ANVP	= 202
$BAZVP	= 204
$TADDR	= 264
$TSIZE	= 266
$AURET	= 766		; address for autoloading
$III	= 2060
$RNDSAV	= 2070
$SAVJMP	= 2134
$BUF	= 2422		; Used by $IUNPK
$BUFOUT	= 3022		; Used by R.TOKEN & BASIC., at least 20 bytes

$PWRTI	= 101626	; RESTORE REGISTERS, THEN RTI
$DEMT	= 100112	; EMT handler
$MIDMBK	= 100140
$MONIT	= 100274
$MCTSS	= 110310	; Read Display State word
$PSREG	= 110346	; Save registers
$PWREG	= 110362	; Restore registers

$FONT	= 112036	; Beginning with char-code 020

$MDMAG	= 116076

$WSTOP	= 120226	; BREAK/STOP message
$WNL	= 120233
$IVEIL	= 121052
$MONIT	= 124302
$TRAP7	= 134340	; Address of TRAP 7 instruction (Out of memory error)
$ISGUN	= 140536
$IUNPK	= 140574
$RTI20	= 146444	; POP R2, R0; RTI
$COCT	= 151254
$CBIN	= 151314

$RPAR 	= 151036	; BASIC TRAP 130 handler; Parse ')'
$LPAR 	= 151046	; BASIC TRAP 127 handler; Parse '('
$SW.C0	= 151650	; BASIC TRAP 101 handler; Skip spaces; Switch by char in (R3)
$SW.C1	= 151650	; BASIC TRAP 101A handler; Switch by char in (R3)
$CL.CH	= 151704	; BASIC TRAP 102 handler; Classify char in (R3)
$ATOI	= 153072	; BASIC TRAP 110 handler; Parse int in (R3)
$COMMA	= 154610	; BASIC TRAP 126 handler; Parse ')'

$BIN	= 161672
$HEX	= 161734
$ISTR	= 161610
$OCT	= 161624
$DAL	= 162162	; Result: R1 = R1 / R2;  R3 = R1 % R2
$PACK	= 163702

$ERROR	= 146706	; "ERROR WORD"
$P.INT	= 153402	; PRINT INT IN R5

$CAT	= 101102	; .WORD '@
$CLT	= 147276	; .WORD '<
$CGT	= 112557	; .WORD '>
$CLPAR	= 147311	; .WORD '(
$CPLUS	= 153472	; .WORD '+
$CCOMMA	= 154614	; .WORD ',

$DGO	= 164710

$UNPCK	= 164750
$ID 	= 166646	; Int to Double
$DI	= 166760	; Double to Int
$FIX	= 176212
$DCMP	= 177034

$STAND	= 166552

$PIDV2	= 175054

$ABS	= 166566
$ATAN	= 174434
$COS	= 173566

$DADD	= 167144
$DSUB	= 167124
$APLMI	= 152606	; address of .WORD $DADD, $DSUB

$DDIV	= 170776
$DMUL	= 170210
$DSGN	= 166614
$EXP	= 171762
$INT	= 176340
$LOG	= 173052
$PUSH8	= 172450	; 4 * PUSH -(R1),
$PUSH1	= 173264	; PUSH 1.0
$RAN	= 175176
$SIN	= 173614
$SQRT	= 171350
$TAN	= 174306

$AMATH	= 152636	; address of .WORD $SQRT, $SIN, $COS, $TAN, $ATAN, $EXP, $LOG, $INT, $FIX, $ABS, $IABS, $ISGN, $DSGN

$KBCTL	= 177660
$KBDAT	= 177662
R$ROL	= 177664

.MACRO	.EXIT
	JMP	100300
	;!!!? JMP	$MONIT
.ENDM

.MACRO	.PRINT	addr
	MOV	addr, R1
	CLR	R2
	EMT	20
.ENDM

.MACRO  .TTYIN	ch
	EMT	6
	.IF NB ch
		MOV	R0, ch
	.ENDC
.ENDM

.MACRO  .TTYOUT	ch
	.IF NB ch
		MOV	ch, R0
	.ENDC
	EMT	16
.ENDM
