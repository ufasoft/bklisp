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

all: bklisp.sav bklisp.10 bklisp.11m

lisp.sav: $(SOURCES) rt11.mlb
	$(MACRO11) /LIST:bklisp.lst bklisp.mac+rt11.mlb/LIB
	pclink11 /EXECUTE:$@ bklisp.OBJ
	rm bklisp.OBJ

lisp.0010.bin: $(SOURCES) bk10.mlb
	$(MACRO11) /LIST:bk10.lst bklisp.mac+bk10.mlb/LIB
	pclink11 /EXECUTE:bk10.sav bklisp.OBJ
	bash -c "tail -c +495 bk10.sav | head -c $$((4 + `od -An --skip-bytes=496 -N2 -d bk10.sav`)) >$@"
#	rm bklisp.OBJ bk10.sav

lisp.11m: $(SOURCES) bk11.mlb
	$(MACRO11) /LIST:bk11.lst bklisp.mac+bk11.mlb/LIB
	pclink11 /EXECUTE:bk11.sav bklisp.OBJ
	dd if=bk11.sav of=$@ bs=1 skip=2044
#	rm bklisp.OBJ bk11.sav

rt11.mlb: rt11.cfg
	RT11 LIBRARY/MACRO/CREATE rt11 rt11.cfg

bk11.mlb: bk11.cfg
	RT11 LIBRARY/MACRO/CREATE bk11 bk11.cfg

bk10.mlb: bk10.cfg
	RT11 LIBRARY/MACRO/CREATE bk10 bk10.cfg

clean:
	-rm *.bin *.11m *.LST *.OBJ *.sav
