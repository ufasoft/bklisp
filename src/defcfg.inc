;;; Copyright (c) 2021-2022 Ufasoft  http://ufasoft.com  mailto:support@ufasoft.com,  Sergey Pavlov  mailto:dev@ufasoft.com
;;;
;;; SPDX-License-Identifier: MIT

;;; Default Configuration definitions for BkLisp


.INCLUDE /config.inc/


.LIST	ME		; Macro expansions
.ENABL	AMA		; address mode 37
.ENABL	LC


...EMT = 1		; Use EMT API for BK-0011M

;; Define C$xxxx on C.xxxx definitions
;; C.xxx are necessary because bash/make/nmake have inconsistent escaping rules of '$' char
.IIF DF C.AMAL,	C$AMAL=C.AMAL
.IIF DF C.RT11,	C$RT11=C.RT11
.IIF DF C.BK10,	C$BK10=C.BK10
.IIF DF C.BK11,	C$BK11=C.BK11


.IIF NDF C$AMAL,	C$AMAL = 1			; Amalgamation build

.IIF NDF C$RT11, 	C$RT11 	= 0			; Define for RT-11
.IIF NE C$BK11		C$BK10 = 0
.IIF NDF C$BK10, 	C$BK10	= 1 - C$RT11		; Define for BK-0010.01 conditional compilation
.IIF NDF C$BK11,	C$BK11	= 1 - <C$BK10 ! C$RT11>	; Define for BK-0011 conditional compilation
.IIF NDF C$B11M,	C$B11M	= C$BK11		; Define for BK-0011M conditional compilation

.IIF NDF C$VM1,		C$VM1	= C$BK10 ! C$BK11	; Define to enable unaligned word access
.IIF NDF C$1801,	C$1801	= C$VM1			; K1801 family

.IIF NDF C$FULL, 	C$FULL 	= C$RT11 		; More features of Full Common Lisp
.IIF NDF C$MVAL,	C$MVAL	= C$FULL		; Multiple values
.IIF NDF C$MACR,	C$MACR	= 0			; Macros
.IIF NDF C$MDAR,	C$MDAR 	= 1			; Multi-dimensional arrays
.IIF NDF C$RAD40,	C$RAD40	= 1			; use RADIX-40 Symbol encoding

.IIF NDF C$FILE, 	C$FILE 	= C$RT11 		; File operations
.IIF NDF C$FEXT, 	C$FEXT 	= 0	 		; Extended file operations: .GFDAT

.IIF NDF C$GTLI,	C$GTLI	= C$RT11		; Use .GTLIN in RT-11
.IIF NDF C$RU,		C$RU	= C$RT11		; Russian 15IE display features


VALLIM = 20.			; MULTIPLE-VALUES-LIMIT
