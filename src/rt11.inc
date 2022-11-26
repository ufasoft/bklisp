;;; Copyright (c) 2021-2022 Ufasoft  http://ufasoft.com  mailto:support@ufasoft.com,  Sergey Pavlov  mailto:dev@ufasoft.com
;;;
;;; SPDX-License-Identifier: MIT

;;; RT-11 definitions

.IF DF C$1801
	.INCLUDE	/k1801.inc/
.IFF
	.INCLUDE	/pdp11.inc/
.ENDC

.MCALL	.CLOSE, .DATE, .DELETE, .ENTER, .EXIT, .FETCH, .GFDAT, .GTIM
.MCALL	.LOOKUP, .PRINT, .QSET, .READW, .RENAME, .SCCA, .SETTOP, .TRPSET, .TTYIN, .TTINR, .TTYOUT, .TWAIT, .UNLOCK, .WRITW
.MCALL	.GTLIN


;; System Communication Area

$USRPC	= 40	; Program start address
$USRSP	= 42	; Initial Stack pointer
$JSW	= 44	; Job Status word
$UFLOA	= 46	; USR load address, normally 0
$USRTO	= 50	; Highest address available for program
$ERRBY	= 52	; (byte) EMT Error code
$USRRB	= 53	; (byte) User Error code
$SYPTR	= 54	; (byte) RMON starting address
$TTFIL	= 56	; (byte) Fill character
$TTNFI	= 57	; (byte) Fill count
$CCB	= 360	; Core Control Block
$CLLEN	= 510
$CLBUF	= 512

;; $JSW bits
EDIT$	= 20
SPXIT$	= 40
TCBIT$	= 100
CHAIN$	= 400
CHNIF$	= 4000
TTLC$	= 40000


;; RMON area offsets
$SYSVE	= 276
$SYSUP	= 277

CLOCK$ = ^B100000
$CNFG1 = 300

; Syscall numbers for EMT 375
S$DELE	= 0	; .DELETE
S$LOOK	= 1	; .LOOKUP
S$ENTE	= 2	; .ENTER
S$RENA	= 4	; .RENAME
S$REA	= 10	; .READW
S$WRI	= 11	; .WRITW
S$GTIM	= 21	; .GTIM
S$GFIN	= 44	; .GFINF

;; Keys on Russian keyboard
$K.RUS	= 16
$K.LAT	= 17
