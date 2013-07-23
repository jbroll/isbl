
[JBR] - 2011-04-02

I first read about ISBL in early 2008 and it has been running about 
my thoughts ever since.  This is mostly because I find SQL to be unintuitive 
and difficult to understand.  I rather like something more algebraic.

I didn't want to write a complete database engine so here is a package 
that is a thin layer translating ISBL to sqlite.  The main ISBL operators 
are available.  Some feature are a little different (delayed evaluation as views).
The type system of "Domains" is absent.

Here are the pieces:

   * [isbl-parser.peg] - The [Parser Tools] parser
   * [isbl-actions.act] - Some template actions for parser rules with similar definitions
   * [isbl.tcl] - An ISBL class to tie the whole thing together
   * [isbl] - A command line interface utility.
   * [unsource] - A little helper to create the module "isbl-1.0.tm"

A Makefile to hold it all together:


 PT=/home/john/src/tcllib-1.13/modules/pt/pt

 VERSION = 1.0

 isbl : main.tcl isbl-$(VERSION).tm
	sdx wrap isbl -runtime `which tclkit8.6`
	make test
 
 isbl-$(VERSION).tm : unsource isbl.tcl isbl-parser.tcl isbl-actions.tcl
	unsource isbl.tcl > isbl-$(VERSION).tm

 isbl-actions.tcl : parser-actions isbl-parser.peg isbl-actions.act
	parser-actions isbl-parser.peg isbl-actions.act > isbl-actions.tcl

 isbl-parser.tcl : isbl-parser.peg
	$(PT) generate snit -class isbl-parser -name isbl-parser isbl-parser.tcl peg isbl-parser.peg
	sed -e s/PACKAGE/isbl-parser/ < isbl-parser.tcl > tmp
	sed -e s/^return//            < tmp > isbl-parser.tcl
	rm tmp

 test : 
	tclkit8.6 ./isbl-test.tcl



