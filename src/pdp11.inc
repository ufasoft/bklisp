;;; Copyright (c) 2021-2022 Ufasoft  http://ufasoft.com  mailto:support@ufasoft.com,  Sergey Pavlov  mailto:dev@ufasoft.com
;;;
;;; SPDX-License-Identifier: MIT

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


OP.NOP	= 240
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

;; Push args into Stack
.MACRO	PUSH	a, b, c, d, e
			MOV	a, -(SP)
	.IIF NB, b,	MOV	b, -(SP)
	.IIF NB, c,	MOV	c, -(SP)
	.IIF NB, d,	MOV	d, -(SP)
	.IIF NB, e,	MOV	e, -(SP)
.ENDM

;; Pop args from Stack
.MACRO	POP	a, b, c, d, e
			MOV	(SP)+, a
	.IIF NB, b,	MOV	(SP)+, b
	.IIF NB, c,	MOV	(SP)+, c
	.IIF NB, d,	MOV	(SP)+, d
	.IIF NB, e,	MOV	(SP)+, e
.ENDM

;; Pascal (Length-prefixed) string.
.MACRO	.ASCIP	s
	.NCHR	$nlen, ^|s|
       	.ASCII	<$nlen>"s"
.ENDM
