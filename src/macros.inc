;;; Copyright (c) 2021-2022 Ufasoft  http://ufasoft.com  mailto:support@ufasoft.com,  Sergey Pavlov  mailto:dev@ufasoft.com
;;;
;;; SPDX-License-Identifier: MIT

;; Macro definitions for frequent procedures


.INCLUDE	/defcfg.inc/
.IIF NE C$RT11	.INCLUDE	/rt11.inc/
.IIF NE C$BK10	.INCLUDE	/bk1001.inc/
.IIF NE C$BK11	.INCLUDE	/bk11.inc/

C.EXTM	= 214


;; Cyrillic letters in KOI8 encoding
C.CY.A	= 341
C.CY.B	= 342
C.CY.G	= 347
C.CY.I	= 351
C.CY.K	= 353
C.CY.M	= 355
C.CY.O	= 357
C.CY.V	= 367
C.CY.W	= 373		; 'Sh'

;; Stack overflow
.MACRO	.E.SO
	TRAP	1
.ENDM

.MACRO	.CKSTK
	CMP	SP, #ASTKLO	; out-of-TRAP check to speedup EVAL
	BHIS	.+4
	.E.SO
.ENDM


;; Syntax error
.MACRO	.E.SX
	TRAP	2
.ENDM

;; Syntax error
.MACRO	.E.ARG
	TRAP	5
.ENDM

;; Math error
.MACRO	ER.MATH
	TRAP	6
.ENDM

;; Divide by zero
.MACRO	.E.DIVZ
	TRAP	11.
.ENDM

;; Type error
.MACRO	.E.TYP
	TRAP	13.
.ENDM

;; UNKNOWN ERROR
.MACRO	.E.UNK
	TRAP	14.
.ENDM

;; Array dimension is too big
.MACRO	.E.DIM
	TRAP	16.
.ENDM

;; Undefined function
.MACRO	.E.FUN
	TRAP	18.
.ENDM

;; I/O error
.MACRO	.E.IO
	TRAP	19.
.ENDM


B.2.4	= 40			; Base 2/4-word procedures
B.SUBR	= 140			; Base TRAP# for .SUBR
B.PRED	= 200			; Base TRAP# for .PRED
B.TYP	= 240			; Base for 'ensure type'
B.LONG	= 300			; Base for long procedures
B.TYPP	= 340			; Base for .TYPEP

;; 2/4-word procedures
.MACRO	.TJ	lab, num
	.IF	NB num
		TRAP	num
	.IFF
		TRAP	<lab - A.TRAP> / 4 + B.2.4
	.ENDC
.ENDM

;; Returns .TYCOD == c
.MACRO	.TYP	c
	TRAP	B.TYP + c
.ENDM

;; Setf CF=1 if .TYCOD == c
.MACRO	.TYPEP	c
	TRAP	B.TYPP + c
.ENDM

.MACRO	.SVECP
	.TYPEP	U.SVEC
.ENDM

.MACRO	.CHARP
	.TYPEP	U.CHAR
.ENDM

.MACRO	.STRP
	.TYPEP	U.STR
.ENDM

.MACRO	.FIXP
	.TYPEP	U.FIXN
.ENDM

.MACRO	.FLTP
	.TYPEP	U.FLT
.ENDM


.MACRO	.TJL	lab, num
	.IF NB num
		TRAP	B.LONG + num
	.IFF
		TRAP	B.LONG + <lab - TRAPS / 2>
	.ENDC
.ENDM


.MACRO	.LENGTH
	.TJ	LENGT., B.SUBR+0
.ENDM

;; R1 = (CONS R1 R2)
.MACRO	.CONS
	.TJ	CONS., B.SUBR+1
.ENDM

.MACRO	.FUNCALL
	.TJ	FUNCA., B.SUBR+2
.ENDM

;; PRIN1 into stream designator R2
.MACRO	.PRIN1
	.TJ	PRIN1., B.SUBR+3
.ENDM

;; Evaluate form in R1 in the current environment
.MACRO	.EVAL1
	.TJ	EVAL1., B.SUBR+4
.ENDM

;; Read Object from R2 Stream
.MACRO	.$READ
	.TJ	READ., B.SUBR+5		; calls READ1
.ENDM

;; PEEK-CHAR
.MACRO	.PEEKC
	.TJ	PEEKC., B.SUBR+6
.ENDM

.MACRO	.CHRUP
	.TJ	CHRUP., B.SUBR+7
.ENDM

;; (SYMBOL-VALUE of sym or R1)
.MACRO	.SYVAL	sym
	.IF NB sym
		.TJL	SYVAL$
		.WORD	sym
	.IFF
		.TJ	SYVAL, B.SUBR+10
	.ENDC
.ENDM

;; (SET R1 R2)
.MACRO	.SET
	.TJ	SET, B.SUBR+11
.ENDM

;; Read char from R2 Stream
;; (READ-CHAR R2 T)
.MACRO	.R.CHR
	.TJ	RCHRT., B.SUBR+12
.ENDM

;; Read optional char from R2 Stream
;; (READ-CHAR R2 NIL NIL)
;; Returns NIL on EOF
.MACRO	.ROCHR
	.TJ	, B.SUBR+13
.ENDM

;; .EVAL1, preserving R5 in stack
.MACRO	.P5EVL
	.TJ	, B.SUBR+14
	POP	R5
.ENDM

;; (MAKE-ARRAY R1)
.MACRO	.MKAR
	.TJ	, B.SUBR+15
.ENDM

.MACRO	.FORMAT
	.TJ	, B.SUBR+16
.ENDM

.MACRO	.LAST
	.TJ	, B.SUBR+17
.ENDM

.MACRO	.CPTREE
	.TJ	, B.SUBR+20
.ENDM

;; SUBST1
.MACRO	.SBST1
	.TJ	, B.SUBR+21
.ENDM

;; (CAR R1)
.MACRO	.CAR
	.TJ	, B.SUBR+22
.ENDM


;; (ARRAY-DIMENSIONS R1)
.MACRO	.ARDMS
	.TJ	, B.SUBR+23
.ENDM

;; Filespace in R1 into 4-word RADIX-50 RT-11 filepath in $BUFOUT
.IF NE C$FILE
	.MACRO	.R50FN
		.TJ	, B.SUBR+24
	.ENDM
.ENDC

.MACRO	.SYMP
	.TJ	, B.PRED+0
.ENDM

.MACRO	.VECP
	.TJ	, B.PRED+1
.ENDM

;; Print char on low byte of R1 into stream designator in R2
.MACRO	.W.CH2
	.TJ	, B.PRED+2
.ENDM

;; (WRITE R1 :stream R2)
.MACRO	.$WRITE
	.TJ	, B.PRED+3
.ENDM

.MACRO	.STREQ
	.TJ	, B.PRED+4
.ENDM

.MACRO	.ZEROP
	.TJ	, B.PRED+5
.ENDM

.MACRO	.MEMBER
	.TJ	, B.PRED+6
.ENDM

.MACRO	.INTP
	.TJ	, B.PRED+7
.ENDM

;; Returns: CF = (EQL R1 R2)
.MACRO	.EQL
	.TJ	, B.PRED+10
.ENDM

;; (UNREAD-CHAR ch stm)
.MACRO	.UNREAD
	.TJ	, B.PRED+11
.ENDM

;; Print object R1 into stream designator R2
.MACRO	.PRNT
	.TJ	, B.PRED+12
.ENDM

;; Is char constituent (calls CSTITP)
.MACRO	.CSTP
	.TJ	, B.PRED+13
.ENDM

.MACRO	.GC
	.TJ	, B.PRED+14
.ENDM

;; WRITE STRING LITERAL INTO STREAM
;; Saves R1
.MACRO	.P.STR	s
	.TJ	, B.PRED+15
	.WORD	s + 3
.ENDM

.MACRO	.CONSP
	.TJ	, B.PRED+16
.ENDM


.MACRO	.LISTP
	.TJ	, B.PRED+17
.ENDM

.MACRO	.BOUNDP
	.TJ	, B.PRED+20
.ENDM

.MACRO	.FRESHL
	.TJ	, B.PRED+21
.ENDM

.MACRO	.FUNAMP
	.TJ	, B.PRED+22
.ENDM

.MACRO	PR.PROGN
	.TJ	, B.PRED+23
.ENDM

.MACRO	.SORT34
	.TJ	, B.PRED+24
.ENDM

.MACRO	.OPENP
	.TJ	, B.PRED+25
.ENDM

.MACRO	.ARP
	.TJ	, B.PRED+26
.ENDM

.MACRO	BEQ.E
	.TJ	BEQ.E.
.ENDM

.MACRO	BNE.E
	.TJ	BNE.E.
.ENDM

.MACRO	BCC.E
	.TJ	BCC.E.
.ENDM

.MACRO	BHIS.E
	BCC.E
.ENDM

.MACRO	BCS.E
	.TJ	BCS.E.
.ENDM

.MACRO	BLO.E
	.TJ	BCS.E.
.ENDM

.MACRO	BCC.F
	.TJ	BCC.F.
.ENDM

.MACRO	BHIS.F
	BCC.F
.ENDM

.MACRO	BCS.F
	.TJ	BCS.F.
.ENDM

.MACRO	BLO.F
	BCS.F
.ENDM

.MACRO	BEQ.F
	.TJ	BEQ.F.
.ENDM

.MACRO	BNE.F
	.TJ	BNE.F.
.ENDM

.MACRO	BCS.T
	.TJ	BCS.T.
.ENDM

.MACRO	BLO.T
	BCS.T
.ENDM

.MACRO	BEQ.T
	.TJ	BEQ.T.
.ENDM

.MACRO	B.NCF
	.TJ	B.NCF.
.ENDM

.MACRO	B.CF
	.TJ	B.CF.
.ENDM

.MACRO	B.ZF
	.TJ	B.ZF.
.ENDM

.MACRO	B.NZF
	.TJ	B.NZF.
.ENDM

.MACRO	RE.NIL
	.TJ	AFALS.
.ENDM

;; (THE CONS x)
.MACRO	T.CONS
	.TJ	CONS.T
.ENDM

;; (THE SYMBOL x)
.MACRO	T.SYM
	.TJ	SYM.T
.ENDM

;; (THE STRING x)
.MACRO	T.STR
	.TJ	STR.T
.ENDM

;; (THE VECTOR x)
.MACRO	T.VEC
	.TJ	T.VEC.
.ENDM

.MACRO	T.AR
	.TJ	T.AR.
.ENDM

.MACRO	T.CHR
	.TJ	T.CHR.
.ENDM

.MACRO	.PRED	pred
	.TJ	PRED.
	.WORD	pred
.ENDM


;; Shift
;; MOV R1, R2; MOV R0, R1
.MACRO	.SH210
	.TJ	SH210.
.ENDM

;; CONVERT R1, R2 INTO INT16
.MACRO .TI16B
       .TJ     TI16B.
.ENDM

;; SWAP R1, R2
.MACRO	.SWP12
	.TJ	SWP12.
.ENDM

;; SWAP R0, R1
.MACRO	.SWP01
	 .TJ	SWP01.
.ENDM

;; (NREVERSE R0)
.MACRO	.NREV0
	.TJ	NREV0.
.ENDM

;; PUSH R1 INTO R0 LIST
;; R0 = (CONS R1 R0)
.MACRO	.PUSH0
	.TJ	PUSH0.
.ENDM

.MACRO	TO.I16
	.TJ	TOI16.
.ENDM

;; CALL SUBROUTINES FROM BASIC ROM
.MACRO	.BASN
	.TJ	BASN.
.ENDM


;; Bind sym to val in dynamic environment
.MACRO	.BIND	sym, val
	.TJL	BIND$
	.WORD	val, sym
.ENDM

;; Call threaded subrouting by ROM BASIC calling convention
.MACRO	.BASIC	tsubr
	.TJL	BASIC$
	.WORD	tsubr
.ENDM

;; (FUNCALL R0 R1 R2)
;.MACRO	.CALL3
;	.TJL	CALL3$
;.ENDM

;; Create list of R0 elements from Stack
.MACRO	.LISTN
	.TJL	LISTN$
.ENDM

;; Create list of R0 elements from Stack using LIST*
.MACRO	.LISTA
	.TJL	LISTA$
.ENDM

;; CF = LOWER <= R1 < UPPER
.MACRO	.BETWE	LOWER, UPPER
	.TJL	BETWE$
	.WORD	LOWER, UPPER
.ENDM


;; Push R1 object as Double
;; Return: R1: DOUBLE object
.MACRO	PU.FL
	.TJL	PU.FL$
.ENDM

;; POP Double into object in R1 (INT OR DOUBLE)
.MACRO	PO.FL
	.TJL	PO.FL$
.ENDM

;; POP DOUBLE INTO OBJECT (INT OR DOUBLE) AND RETURN
.MACRO	POFL.R
	.TJL	RPOFL$
.ENDM


;; Write one or twor characters into Stream in R2
.MACRO	.P.CHR	A, B
			.WORD	7000 + A         ; using Invalid Instruction vector
	.IIF NB, B,	.WORD	7000 + B
.ENDM

;; Allocate  cell in R1
.MACRO	.ALL.1
	.TJL	ALL.1$
.ENDM

;; Allocate 2 cells in R1
.MACRO	.ALL.2
	.TJL	ALL.2$
.ENDM

;; R5: size in bytes
.MACRO	.ALLOC
	.TJL	ALLOC$
.ENDM

;; From INT16 into Object and return
.MACRO	FI16.R
;	.TJL	FI16R$
	.TJ	FI16R.
.ENDM

;; Returns pointer to place in R4, or ZF=1
.MACRO	.PLACE
	.TJL	PLACE$
.ENDM

.MACRO	.PLAC1			; used in init.mac, where trap symbols are not available
	TRAP	300
.ENDM

;; R1: Symbol
;; Returns R4: address of symbol place
.MACRO	.GPLAC
	.TJL	GPLAC$
.ENDM

.MACRO	.DF2	V
	.TJL	DF2$
	.WORD	V
.ENDM

.MACRO	.DF1.NIL
	.TJL	DF1NI$
.ENDM

;; Returns R0: Type code of Object in R1
.MACRO	.TYCOD
	.TJL	TYCOD$
.ENDM

.MACRO	RE.T
	.TJL	ATRUE$
.ENDM

;; FROM UINT16 INTO OBJECT
.MACRO	F.U16
	.TJL	F.U16$
.ENDM

.MACRO	.DF3.NIL
;	.TJL	DF3NI$
	.TJ	DF3NI.
.ENDM

;; Pop car from list in R1 into R0
;; CF = success
.MACRO	.POP1
	.TJL	POP1$
.ENDM

;; Pop car from list in R5 into R1
;; CF = success
;; On empty list: don't change R1
.MACRO	.POP5
;	.TJL	POP5$
	.TJ	POP5.
.ENDM

.MACRO	TO.STM
;	.TJL	STMTO$
	.TJ	STM.TO
.ENDM

;; .SUBR GETTIM; PU.FL
.MACRO	PU.NOW
	.TJL	NOWPU$
.ENDM

.MACRO	TO.U16
	.TJL	TOU16$
.ENDM

.MACRO	TO.FUN
	.TJL	FUNTO$
.ENDM


.MACRO	.TCASE
	.TJL	TCASE$
.ENDM

;; Searches byte value in R1 in array
.MACRO	.CCASE
;	.TJL	CCASE$
	.TJ	CCASE.
.ENDM

.MACRO	.SUBR	A
	.TJL	SUBR$
	.WORD	A
.ENDM


V.CHB	= 177000
V.C.SP	= V.CHB + C.SP
V.C.HT	= V.CHB + C.HT
V.C.NL	= V.CHB + C.NL
V.C.CR	= V.CHB + C.CR
V.C.0	= V.CHB + '0
V.C.9	= V.CHB + '9
V.C.A	= V.CHB + 'A
V.C.B	= V.CHB + 'B
V.C.D	= V.CHB + 'D
V.C.G	= V.CHB + 'G
V.C.N	= V.CHB + 'N
V.C.O	= V.CHB + 'O
V.C.X	= V.CHB + 'X
V.C.Y	= V.CHB + 'Y
V.C.Z	= V.CHB + 'Z
V.C.ES	= V.CHB + '\
V.C.QO	= V.CHB + ''
V.C.DQ	= V.CHB + '"
V.C300	= V.CHB + 300
V.C340	= V.CHB + 340
V.U	= 177777		; Unbound value
V.DOT	= 177776		; Special DOT token
;!!!not used; V.EOF	= 177775


;; TYPE CODES
U.NULL	= 0	; NULL
U.FIXN	= 1	; FIXNUM
U.CHAR	= 2	; CHARACTER
U.CONS	= 3	; CONS
U.SYM	= 4	; SYMBOL
U.FLT	= 5	; FLOAT
U.STM	= 6	; STREAM
U.STR	= 7	; STRING
U.SVEC	= 10	; SIMPLE VECTOR
U.FUN	= 11	; SYSTEM FUNCTION
U.LAMB	= 12	; LAMBDA FUNCTION
U.SPOP	= 13	; SPECIAL OPERATOR
.IIF NE C$MDAR, U.AR	= 14
.IIF NE C$FILE, U.FILE	= 15

MAXTOK = 31.	; Max token length 4*n-1

.IF NE C$BK10
	ASTKLO	= 300
	ASTKUP	= 1004	; +4: space for JMP @#START instruction
.IFF
	ASTKLO	= 400
	ASTKUP	= 4000	; Includes 1K for GC bitmap
.ENDC

;FIXOFF	= ASTKUP + 2500. / 2 & 177774		; multiple of 4 for calendaric calculations
FIXOFF	= ASTKUP + 2500. / 2 & 177400		; multiple of 4 for calendaric calculations & multiple of 256. for GET-OUTPUT-STREAM-STRING

V.M.1K	= FIXOFF + -1000.
V.M.1	= FIXOFF + -1
V.0	= FIXOFF + 0
V.1	= FIXOFF + 1
V.2	= FIXOFF + 2
V.8	= FIXOFF + 8.
V.10	= FIXOFF + 10.
V.16	= FIXOFF + 16.
V.24	= FIXOFF + 24.
V.60	= FIXOFF + 60.
V.254	= FIXOFF + 254.
V.255	= FIXOFF + 255.
V.1000	= FIXOFF + 1000.
V.1900	= FIXOFF + 1900.


.IF EQ C$AMAL
	;; Hardcoded for modularization
	;; Bit.2 of HEAP address must be 0. Used by AND/OR
	.IIF NE C$BK10,	HEAP	= 022400
	.IIF NE C$BK11,	HEAP	= 042700	; because of system area in 042600
	.IIF NE C$RT11,	HEAP	= 042700
.ENDC ; C$AMAL

.IF NE C$BK10
	HIMEM	= 40000		; End of Heap
	HIMEME	= 70000		; End of Heap in Extended-memory mode
.ENDC ; C$BK10

.IF NE C$BK11
	HIMEM	= 140000	; End of Heap  BK-11
	HIMEME	= HIMEM
.ENDC ; C$BK11

.IIF NE C$BK10 EHEAP	= $ANVP

.IF NE C$RT11
	TESTCH	= 0		; must be 0 for .SYS macro

	;; System call with args:	#AREA, #TESTCH, #$BUFOUT
	;; n: syscall#
	.MACRO	.SYS n
		.TJL	SYS$
		.WORD	n * 256.
	.ENDM

.ENDC	; C$RT11
