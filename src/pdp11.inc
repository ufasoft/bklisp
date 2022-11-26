;;; Copyright (c) 2021-2022 Ufasoft  http://ufasoft.com  mailto:support@ufasoft.com,  Sergey Pavlov  mailto:dev@ufasoft.com
;;;
;;; SPDX-License-Identifier: MIT

C.NULL	= 0
C.BEL	= 7
C.HT	= 11
C.NL	= 12
C.VT	= 13
C.FF	= 14
C.CR	= 15
C.ESC	= 33
C.SP	= 40
C.SEMI	= 73


FLAG.C	= 1
FLAG.V	= 2
FLAG.Z	= 4
FLAG.N	= 10
FLAG.T	= 20

OP.NOP	= 240
OP.BR	= 400
OP.EMT	= 104000
OP.TRAP	= 104400

$DFLPS = 340		; default PSW for trap interrupt vectors

.MACRO	ALGN4
	.=<.+3>/4*4
.ENDM

.MACRO	ALGN8
	.=<.+7>/8.*8.
.ENDM

.MACRO	ALGN32
	.=<.+31.>/32.*32.
.ENDM

;;; Idioms

;; reg -= 2
.MACRO	DEC2	reg
	.IIF NE C$VM1,	TST	-(reg)
	.IIF EQ C$VM1,	BITB	-(reg), -(reg)
.ENDM

;; reg += 2
.MACRO	INC2	reg
	.IIF NE C$VM1,	TST	(reg)+
	.IIF EQ C$VM1,	BITB	(reg)+, (reg)+
.ENDM

;; Push args into Stack
.MACRO	PUSH	c, d, e, f, g, h
	.IRP	x, <c, d, e, f, g, h>
		.IIF	B, x,	.MEXIT
		MOV	x, -(SP)
	.ENDR
.ENDM

;; Pop args from Stack
.MACRO	POP	c, d, e, f, g, h
	.IRP	x, <c, d, e, f, g, h>
		.IIF	B, x,	.MEXIT
		MOV	(SP)+, x
	.ENDR
.ENDM

;; Pascal (Length-prefixed) string.
.MACRO	.ASCIP	s
	.NCHR	$nlen, ^|s|
       	.ASCII	<$nlen>"s"
.ENDM


.MACRO	.SBYT	sb
	.IF	P1
		.BYTE 0
	.IFF						; sb is known on phase 2
		.IF GT sb - 127.
       			.ERROR	sb is out of bounds
		.IFF
       			.IF LT sb + 128.
       				.ERROR	sb is out of bounds
       			.IFF
       				.BYTE	sb
       			.ENDC
		.ENDC
       	.ENDC
.ENDM

;; Signed byte with bounds check
.MACRO	.SBYTE	c, d, e, f, g, h
	.IRP	x, <c, d, e, f, g, h>
		.IIF	B, x,	.MEXIT
		.SBYT	x
	.ENDR
.ENDM
