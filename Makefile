 PT=/home/john/pkg/tcllib-1.13/modules/pt/pt

 VERSION = 1.0

 isbl : main.tcl isbl-$(VERSION).tm
	sdx wrap isbl -runtime `which tclkit8.6`
	make test
 
 isbl-$(VERSION).tm : unsource isbl.tcl isbl-parser.tcl isbl-actions.tcl
	unsource isbl.tcl > isbl-$(VERSION).tm

 isbl-actions.tcl : parser-actions isbl-parser.peg isbl-actions.act
	parser-actions isbl-parser.peg isbl-actions.act > isbl-actions.tcl

 isbl-parser.tcl : isbl-parser.peg
	#$(PT) generate snit -class isbl-parser -name isbl-parser isbl-parser.tcl peg isbl-parser.peg
	$(PT) generate oo -class isbl-parser -name isbl-parser isbl-parser.tcl peg isbl-parser.peg
	sed -e s/PACKAGE/isbl-parser/ < isbl-parser.tcl > tmp
	sed -e s/^return//            < tmp > isbl-parser.tcl
	rm tmp

 test : 
	tclkit8.6 ./isbl-test.tcl


