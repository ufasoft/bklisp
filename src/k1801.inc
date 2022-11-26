;;; Copyright (c) 2021-2022 Ufasoft  http://ufasoft.com  mailto:support@ufasoft.com,  Sergey Pavlov  mailto:dev@ufasoft.com
;;;
;;; SPDX-License-Identifier: MIT

;;; K1801VM1/2/3 CPU definitions

.INCLUDE	/pdp11.inc/



$TMFMX	= 24		; Enable Timer on maximal frequency
$TMFMN	= 164		; Enable Timer on minimal frequency with Monitoring
$TMLIM	= 177706
$TMCNT	= 177710
$TMCSR	= 177712

$ERREG 	= 177704
$SYREG	= 177716

$KBCTL	= 177660
$KBDI	= 100		; bit in register 177660 to disable Keyboard interrupt
