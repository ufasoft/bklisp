;;; Copyright (c) 2021-2022 Ufasoft  http://ufasoft.com  mailto:support@ufasoft.com,  Sergey Pavlov  mailto:dev@ufasoft.com
;;;
;;; SPDX-License-Identifier: MIT

;;; RT-11 definitions

.IF NE C$1801
	.INCLUDE	/k1801.inc/
.IFF
	.INCLUDE	/pdp11.inc/
.ENDC

.MCALL	.CLOSE, .EXIT, .GTIM, .PRINT, .SCCA, .SETTOP, .TRPSET, .TTYIN, .TTINR, .TTYOUT


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
