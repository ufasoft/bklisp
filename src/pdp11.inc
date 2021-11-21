;;; Copyright (c) 2021 Ufasoft  http://ufasoft.com  mailto:support@ufasoft.com,  Sergey Pavlov  mailto:dev@ufasoft.com
;;;
;;; SPDX-License-Identifier: MIT


C.HT	= 11
C.NL	= 12
C.LF	= 14
C.CR	= 15
C.SP	= 40
C.SEMI	= 73


FLAG.N	= 10
FLAG.Z	= 4
FLAG.V	= 2
FLAG.C	= 1


OP.NOP	= 240
OP.TRAP	= 104400

.MACRO	ALIGN4
	.=<.+3>/4*4
.ENDM

.MACRO	ALIGN8
	.=<.+7>/8.*8.
.ENDM

.MACRO	ALGN32
	.=<.+31.>/32.*32.
.ENDM

;; PUSH ARGS
.MACRO	PUSH	A, B, C, D, E
			MOV	A, -(SP)
	.IIF NB, B,	MOV	B, -(SP)
	.IIF NB, C,	MOV	C, -(SP)
	.IIF NB, D,	MOV	D, -(SP)
	.IIF NB, E,	MOV	E, -(SP)
.ENDM

;; POP ARGS IN REVERSE ORDER
.MACRO	POP	A, B, C, D, E
			MOV	(SP)+, A
	.IIF NB, B,	MOV	(SP)+, B
	.IIF NB, C,	MOV	(SP)+, C
	.IIF NB, D,	MOV	(SP)+, D
	.IIF NB, E,	MOV	(SP)+, E
.ENDM
