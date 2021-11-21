bklisp.bin: bklisp.OBJ symdef.OBJ
	pclink11 bklisp.OBJ symdef.OBJ
	dd if=bklisp.sav of=bklisp.bin bs=1w skip=246 count=6554
	rm bklisp.sav

bklisp.OBJ: bklisp.mac config.inc bk1001.inc macros.inc pdp11.inc k1801.inc fsubr.mac init.mac subr.mac subr1.mac subr2.mac subr3.mac trap.mac print.mac gc.mac rad40.mac rad50.mac
	START /WAIT RT11 MACRO /LIST:bklisp.lst bklisp.mac

symdef.OBJ: bk1001.inc config.inc macros.inc pdp11.inc k1801.inc symdef.mac
	START /WAIT RT11 MACRO /LIST:symdef.lst symdef.mac
