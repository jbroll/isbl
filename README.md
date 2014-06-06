
ISBL is the original database query language.

I first read about ISBL in early 2008 and it has been running about 
my thoughts ever since.  This is mostly because I find SQL to be unintuitive.
I rather like something more algebraic.  ISBL gives us a peek into what
might have been.

This package impliments a DSL that is like the ISBL described in the original PRTV
paper and allows the opportunity to explore a truely relation notation for database
query expressions.  It is a thin layer that converts ISBL into SQL and executes the
result on an SQLite database.

ISBL expressions can be evaluated on the command line or from within a Tcl script.

There are lots of scripted examples in the test script isbl-test.tcl.

Command line examples:

    ./isbl sample.db eval 'T += % "John" -> first, "Smith" -> last, 665 -> Id'
    ./isbl sample.db eval 'T += % "John" -> first, "Jones" -> last, 666 -> Id'
    ./isbl sample.db eval 'T += % "Frank" -> first, "Jones" -> last, 667 -> Id'
    ./isbl sample.db eval 'T += % "Martha" -> first, "Jones" -> last, 668 -> Id'
    ./isbl sample.db eval 'T += % "Rose" -> first, "Tyler" -> last, 669 -> Id'
    ./isbl sample.db list T
    first	last	Id
    -----	----	--
    Frank	Jones	667
    John	Jones	666
    John	Smith	665
    Martha	Jones	668
    Rose	Tyler	669

    ./isbl sample.db list 'T % Id, First'
    Id	First
    --	-----
    667	Frank
    666	John
    665	John
    668	Martha
    669	Rose

The pieces:

   * [isbl-parser.peg] - The [Parser Tools] parser
   * [isbl-actions.act] - Some template actions for parser rules with similar definitions
   * [isbl.tcl] - An ISBL class to tie the whole thing together
   * [isbl] - A command line interface utility.
   * [unsource] - A little helper to create the module "isbl-1.0.tm"

