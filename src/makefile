### Copyright (c) 2021-2022 Ufasoft  http://ufasoft.com  mailto:support@ufasoft.com,  Sergey Pavlov  mailto:dev@ufasoft.com
###
### SPDX-License-Identifier: MIT


### Makefile for building BkLisp for following systems:
###   BK-0010.01
###   BK-0011M
###   RT-11


SOURCES	= bklisp.mac defcfg.inc bk1001.inc bk11.inc macros.inc pdp11.inc k1801.inc fsubr.mac init.mac subr.mac subr1.mac subr2.mac \
	subr3.mac symdef.mac trap.mac print.mac gc.mac rad40.mac rad50.mac math.mac

all: bklisp.10 bklisp.11m bklisp.sav

bklisp.10: $(SOURCES)
	echo C$$BK10=1 >config.inc
	RT11 MACRO /LIST:bk10.lst bklisp.mac
	pclink11 /EXECUTE:bk10.sav bklisp.OBJ
	dd if=bk10.sav of=$@ bs=1 skip=492
#	rm bklisp.OBJ bk10.sav

bklisp.11m: $(SOURCES)
	echo C$$BK11=1 >config.inc
	RT11 MACRO /LIST:bk11.lst bklisp.mac
	pclink11 /EXECUTE:bk11.sav bklisp.OBJ
	dd if=bk11.sav of=$@ bs=1 skip=2044
#	rm bklisp.OBJ bk11.sav

bklisp.sav: $(SOURCES)
	echo C$$RT11=1 >config.inc
	START /WAIT RT11 MACRO /LIST:bklisp.lst bklisp.mac
	pclink11 bklisp.OBJ
	rm bklisp.OBJ

clean:
	-rm *.bin *.LST *.OBJ *.SAV
