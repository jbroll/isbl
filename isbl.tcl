
 set HOME /Users/john

 lappend auto_path $HOME/lib/tcllib-1.15/modules 

 package require TclOO
 package require snit
 package require sqlite3
 package require tcl::chan::events
 package require tcl::chan::string

 source isbl-parser.tcl

 # Here are some little helpers.
 #
 proc K { x y } { set x }
 proc cat { file } { K [read [set fp [open $file]]] [close $fp] }
 proc lremove { list value args } { 				# http://wiki.tcl.tk/15659 Thanks to RS
    lsearch -all -inline -not -exact {*}$args $list $value
 }
 proc echo { args } { return [join $args " "] }
 proc : { args } {
    set body [lindex $args end]
    set reply {}
    foreach {*}[lrange $args 0 end-1] { append reply [subst $body] }

    set reply
 }
 proc map { args } {
    set body [lindex $args end]
    set reply {}
    foreach {*}[lrange $args 0 end-1] { lappend reply [eval $body] }

    set reply
 }
proc intersect3 {list1 list2 inList1 inList2 inBoth} {
    upvar $inList1 in1
    upvar $inList2 in2
    upvar $inBoth  inB

    set in1 [list]
    set in2 [list]
    set inB [list]

    set list1 [lsort $list1]
    set list2 [lsort $list2]

    # Shortcut for identical lists is faster
    if { $list1 == $list2 } {   
	set inB $list1
    } else {
	set i 0
	    foreach element $list1 {
		if {[set p [lsearch [lrange $list2 $i end] $element]] == -1} {
		    lappend in1 $element
		} else {
		    if { $p > 0 } {
			set e [expr {$i + $p -1}]
			    foreach entry [lrange $list2 $i $e] {
				lappend in2 $entry
			    }
			incr i $p
		    }
		    incr i
			lappend inB $element
		}
	    }
	foreach entry [lrange $list2 $i end] {
	    lappend in2 $entry
	}
    }
} ;# David Easton

 oo::class create isbl {
    variable parser string count	\
	     cStack cColumns cType	\
	     Templates FunType

    constructor { database } {
	set count 0
	sqlite3 [namespace current]::sql $database

	# Sql statement templates for each isbl operator
	#
	 #/  { select distinct %c1 from (%a1) NATURAL JOIN (%a2) }
	set Templates { 						# This should be a classvar?
	 +  { select * from (%a1) UNION select * from (%a2) }
	 .  { select * from (%a1) INTERSECT select * from (%a2) }
	 -  { select * from (%a1) EXCEPT select t1.* from (%a1) as t1 NATURAL JOIN (%a2) }
	 :  { select * from (%a1) where (%a2) }
	 %  { select distinct %a2 from (%a1) }
	 *  { select * from (%a1) NATURAL JOIN (%a2) }
	 /  { select distinct (%c1) from
	     	((%a1) NATURAL JOIN (%a2))
	      group by %c1
	      having count() == (select count() from (%a2))
	    }
	}

	set parser [isbl-parser]
    }

    # This block of methods generates sql from the AST built by the isbl-parser peg parser.
    # Each method can be seen as the parser "action" associated with the corresponding rule.
    # 
    # Many of the non-terminal symbols in the grammer are evaluated using the same code.
    # The parser-actions preprocessor reads the grammer file and generates a bunch of parser
    # actions from the directives given in the comments there and the templates provided 
    # in the isbl-actions.act file we include the generated actions here.
    #
    source isbl-actions.tcl

    method Tupple  { start end args } {			; # Use select wo/from to generate a tupple.
	my cPush {}
	K "select [my {*}[lindex $args 1]]" [my cPop; my cPush $cColumns]
    }
    method Sum     { start end args } { my Operator $args }	; # These are the operators.
    method Join    { start end args } { my Operator $args }
    method Select  { start end args } { my Operator $args }
    method Project { start end args } { my Operator $args }
    method Operator { args } {					; # Convert infix to sql using the
	set args [lindex $args 0]				; # template sql strings.
	set reply [my {*}[lindex $args 0]]
	foreach { op a2 } [lrange $args 1 end] {
	    set op [my {*}$op]
	    set a2 [my {*}$a2]

	    intersect3 [lindex $cStack end-1] [lindex $cStack end] c1 c2 cB
	    set c1 [join [map c $c1 { lindex $c 0 }] ,]
	    set c2 [join [map c $c2 { lindex $c 0 }] ,]
	    set cB [join [map c $cB { lindex $c 0 }] ,]

	    my cOperator $op

	    set reply [string map [list %a1 $reply %a2 $a2 %c1 $c1 %c2 $c2 %cB $cB] [dict get $Templates $op]]
	}

	set reply
    }
    # A top level sql expression.  
    #
    # The top level evaluation returns a list to evaluate
    #
    method TopExpr  { start end relexpr } { list [my {*}$relexpr] }
    method Assign   { start end args } { 			; # Insert into or Overwrie a table.

	set tab [my {*}[lindex $args 0]]
	set  op [my {*}[lindex $args 1]]
	set val [my {*}[lindex $args 2]]
	set drop {}
	set sql  {}

	set Val $val

	if { [llength $val] == 1 } { set Val "select * from $val" }

	switch $op {
	 = { set sql [subst {
		drop table if exists $tab ;
		drop view  if exists $tab ;
		create table $tab ( [join [lindex $cStack end] ,] 
		    , constraint uc_set unique ( [join [map x [lindex $cStack end] { lindex $x 0 }] ,] )
			on conflict replace ) ;
		insert or replace into $tab $Val ;
	     }]
	 }
	 += { set sql [subst { insert or replace into $tab $Val ; }] }
	 := { set sql [subst {
		drop view  if exists $tab ;
		drop table if exists $tab ;
		create view $tab as $val ;
	      }]
	 }
	 -= { return [list $Val [subst {
		sql eval {
		    delete from $tab
		    where [join [: col [my cPop] { [list [lindex $col 0]=\$[lindex $col 0]] }] " and "]
	        }
	    }]]
	 }
	 default {

	     if { [lindex [lindex $args 1] 0] eq "Cols" } {
		 set ncols [map c [my cPop] { lindex $c 0 }]	
		 set tcols [map c [my cPop] { lindex $c 0 }]
		 set scols [split $op ,]

		 intersect3 $ncols $tcols inN inT ccols
		 intersect3 $ccols $scols ycols xxxx xcols

		 return [list $Val [subst {
		    sql eval {
			update $tab
			set   [join [: col $ycols { [list $col=\$$col] }] ,]
			where [join [: col $xcols { [list $col=\$$col] }] " and "]
		    }
	         }]]
	     } else {
		 error ???
	     }
	 }
	}

	list [subst {
	    begin  transaction ;
	    $sql;
	    commit transaction ;
	}]
    }
    method  Cols    { start end args } {			; # This part of the grammer tracks the 
	set columns {}						; # column definition of a term.
	foreach arg $args { set columns [my {*}$arg $columns] }

	foreach col $columns {
	    switch [llength $col] {
		1 { lappend Columns $col;               lappend sql  $col }
		2 { lappend Columns $col;               lappend sql  [lindex $col 0] }
		3 { lappend Columns [lrange $col 0 1];  lappend sql "[lindex $col 2] as [lindex $col 0]" }
	    }
	}
	set cColumns $Columns
	join $sql ,
    }
    method  Col { start end column columns } { my {*}$column $columns }
    method  CFunc { start end name in out columns } { 
	set name [my {*}$name]
	set args [my {*}$in]

	set n 0
	set call "set [namespace current]::__$name \[$name {*}\$args]"

	foreach col [split [my {*}$out] ,] {
	    if { [info proc [namespace current]::__$name$n] eq {} } {
		sql function __$name$n [namespace current]::__$name$n
		proc [namespace current]::__$name$n args [subst {
		    $call
		    lindex $[namespace current]::__$name $n
		}]
	    }
	    lappend reply [list $col [lindex $FunType($name) $n] __$name${n}($args)]

	    incr n
	    set call {}
	    set args {}
	}
	lappend $columns {*}$reply
    }
    method CName    { start end columns } { 
	set col [string range $string $start $end]

	set columns [lremove $columns $col -index 0]
	lappend columns [list $col [my cType $col]]
    }
    method CAll { start end columns } {
	set all [my cAll]
	foreach col $columns { set all [lremove $all [lindex $col 0] -index 0] }

	lappend columns {*}$all
    }
    method CDel { start end columns } {
	if { $columns eq {} } {
	    set columns [my CAll $start $end $columns]
	}
	lremove $columns [string range $string $start $end] -index 0
    }
    method CEqu { start end column value columns } {
	set val [my {*}$value]
	set col [my {*}$column]

	set columns [lremove $columns $col]
	lappend columns [list $col $cType $val]
    }
    method CMap { start end value column columns } {
	set val [my {*}$value]
	set col [my {*}$column]

	set columns [lremove $columns $col]
	lappend columns [list $col $cType $val]
    }
    method Table    { start end } { my cTab  [string range $string $start $end] }
    method VName    { start end } { my tType [string range $string $start $end] }
    method Real     { start end } { my tReal; string range $string $start $end  }
    method Int      { start end } { my tInt;  string range $string $start $end  }
    method String   { start end } { my tTxt;  string range $string $start $end  }

    method EOF	    { args } {}


    # These methods are the "op codes" of the column tracking machine
    #
    method cTab  { table  } { my cPush [my cColumns $table]; set table }
    method cOperator { Op } {
	switch $Op {
	    % { my cPop; my cPush $cColumns }
	    * { 
		set c2 [my cPop]
		set c1 [my cPop]
		set cc $c1
		foreach col $c2 {
		    if { [lsearch -index 0 $c1 [lindex $col 0]] < 0 } { lappend cc $col }
		}
		my cPush $cc
	    }
	    / {
		set c2 [my cPop]
		set c1 [my cPop]

		intersect3 $c1 $c2 in1 in2 inB

		my cPush $in1
	    }
	    + - - - . { my cPop }
	}
    }
    method cColumns { Table } {
	set x {}
	sql eval [subst { pragma table_info($Table) }] { lappend x [list $name $type] }
	set x
    }
    method cAll     {} { lindex $cStack end }
    method cPop	    {} { K [lindex $cStack end] [set cStack [lrange $cStack 0 end-1]] }
    method cPush    { value } { lappend cStack $value }
    method cType { column } { lindex [my tCol $column] 1 }

    method tReal {} { set cType real }
    method tInt	 {} { set cType int }
    method tTxt	 {} { set cType text }
    method tCol  { column } { lindex $cStack end [lsearch -index 0 [lindex $cStack end] $column] }
    method tType { column } {
	set cType [lindex [my tCol $column] 1]
	set column
    }
    unexport cTab cOperator cColumns cColumns cAll cPop cPush cType tReal tInt tTxt tCol tType 

    # Here is the worker bee
    #
    method isbl2ast { isbl } {
	set string $isbl
	K [set ast [$parser parse [set chan [::tcl::chan::string $string]]]] [close $chan]
    }

    method isbl2sql { isbl } {
	set cStack   {}
	set cColumns {}

	try {
	    set sql {}
	    set sql [my {*}[my isbl2ast $isbl]]
	} on error message {
	    puts "$message"
	    lassign $message rde pos
	    if { $rde eq "pt::rde" } {
		error "syntax : [string range $string 0 $pos] ?? [string range $string $pos+1 end]"
	    } else {
		error $message
	    }
	}

	if { [llength [split [lindex $sql 0] " "]] == 1 } {
	    set sql [lreplace $sql 0 0 "select * from $sql"]
	}


	#puts "ast : $ast"
	#puts "sql : $sql"

	set sql
    }

    # Evaluate the sql on the attached sqlite database.  This is how we interact with sqlite.
    #
    method sql { sql args } { uplevel [list [namespace current]::sql eval $sql {*}$args] }

    method eval { isbl } { 				; # Evaluate an isbl expression
	set sql {}
	try { sql eval {*}[set sql [my isbl2sql $isbl]]
	} on error message {
	    puts "$message : $sql"
	    error $message
	}
    }
    method +ast { isbl } { puts [my isbl2ast $isbl] } 	; # Print ast result for debugging
    export +ast
    method +sql { isbl } { puts [my isbl2sql $isbl] }	; # Print sql result for debugging
    export +sql
    method list { isbl } {				; # List expression result as tab table
	set sql [lindex [my isbl2sql $isbl] 0]

	if { [lindex $cStack 0] eq {} } {
	    puts stderr "No Table?"
	    exit 1
	}
	foreach col [lindex $cStack 0] { lappend columns [lindex $col 0] }

	puts [join $columns "\t"]
	puts [regsub -all {[^\t]} [join $columns "\t"] -]

	try {
	    sql eval $sql T {
		set sep ""
		foreach name $T(*) {
		    puts -nonewline "$sep$T($name)"
		    set sep "\t"
		}
		puts ""
	    }
	} on error message {
	    puts "[self] list $isbl : $sql : $message"
	}
    }
    method read { table { file - } } {
	if { $file eq "-" } {
	    set fp stdin
	} else {
	    set fp [open $file]
	}
	set header [gets $fp]
	set dashes [gets $fp]

	set op =
	while {[gets $fp line] >= 0} {
	    my eval "$table $op % [join 	\
				  [map name $header value $line {
				      	echo $name = [expr { [string is double $value] ? $value : "\"$value\"" }] 
				  }] ", "]"
	    set op +=
	}
	close $fp
    }
    method function { type func args  body } { 		; # Define a function
	set FunType($func) $type

	sql function $func $func
	proc [namespace current]::$func $args $body
    }
 }
