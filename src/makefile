### Copyright (c) 2021-2022 Ufasoft  http://ufasoft.com  mailto:support@ufasoft.com,  Sergey Pavlov  mailto:dev@ufasoft.com
###
### SPDX-License-Identifier: MIT


### Makefile for building BkLisp for following systems:
###   RT-11
###   BK-0010.01
###   BK-0011M

MACRO11=RT11 MACRO

MAINSOURCES = bklisp.mac defcfg.inc bk1001.inc bk11.inc bkkeys.inc macros.inc pdp11.inc k1801.inc rt11.inc fsubr.mac init.mac subr.mac subr1.mac subr2.mac \
	subr3.mac trap.mac print.mac calend.mac file.mac gc.mac rad40.mac rad50.mac math.mac

SOURCES	= $(MAINSOURCES) symdef.mac

all: bklisp.SAV bklisp.10 bklisp.11m

bklisp.SAV: $(SOURCES)
	echo C.RT11=1 >config.inc
	$(MACRO11) /LIST:bklisp.lst bklisp.mac
	pclink11 /EXECUTE:$@ bklisp.OBJ
	rm bklisp.OBJ

bklisp.10: $(SOURCES)
	echo C.BK10=1 >config.inc
	$(MACRO11) /LIST:bk10.lst bklisp.mac
	pclink11 /EXECUTE:bk10.SAV bklisp.OBJ
	dd if=bk10.SAV of=$@ bs=1 skip=492
#	rm bklisp.OBJ bk10.SAV

bklisp.11m: $(SOURCES)
	echo C.BK11=1 >config.inc
	$(MACRO11) /LIST:bk11.lst bklisp.mac
	pclink11 /EXECUTE:bk11.SAV bklisp.OBJ
	dd if=bk11.SAV of=$@ bs=1 skip=2044
#	rm bklisp.OBJ bk11.SAV

clean:
	-rm *.bin *.LST *.OBJ *.SAV
