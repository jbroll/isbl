#!/usr/bin/env tclkit8.6
#

 lappend auto_path /home/john/lib /Users/john/lib

 ::tcl::tm::path add .

 package require isbl 1

 isbl create db data.db

 proc ? { 1 2 } { if { $1 ne [string trim $2] } { error "Huh? $1 ne $2" } }


 # Table construction
 #
 db eval { T  = % 1->x, 2->y }				; # make some tables from tuples
 db eval { T  = % 1->x, 4->y }				; # Assignment deletes old data!
 db eval { K  = % 1->x, 5->l }

 db eval { T += % 5->x, 9->y }				; # Insert 
 db eval { T += % 7->x, 9->y }				; # Insert
 db eval { T -= % 7->x }				; # Delete


 db eval { X := T % x }					; # isbl reference by name (sql view)
 ? [db eval X] { 1 5 }

 # Relational Operators
 #
 ? [db eval { T }] 		{ 1 4 5 9 }		; # A single table

 db eval { T += % 5->x, 9->y }				; # Insert this again - It should replace.
 db eval { T += % 5->x, 9->y }				; # Insert this again - It should replace.

 ? [db eval { T }] 		{ 1 4 5 9 }		; # Better not have changed

 ? [db eval { T % x }]		{ 1 5 }			; # Project
 ? [db eval { (T + K) % x }]	{ 1 5 }			; # Union
 ? [db eval { T % x . K % x }]	{ 1 }			; # Intersect
 ? [db eval { T % x - K % x }]	{ 5 }			; # Difference
 ? [db eval { T * K }]		{ 1 4 5 }		; # Join
 ? [db eval { T : x == 1 }]	{ 1 4 }			; # Select

 ? [db eval { T * K % l -> x, x -> f }]	{ 5 9 1 }	; # Column mapping w/->
 ? [db eval { T * K % l as x, x as f }]	{ 5 9 1 }	; # Column mapping w/as


 # Special forms
 #
 db function int          mod2 { x } { expr { int($x) % 2 } }
 db function { real int } func { x } { list [expr $x*2] 2 }

 ? [db eval { T : mod2(x) }]       { 1 4 5 9 }	; # Select from function return value
 ? [db eval { T % func(x | a,b) }] { 2 2 10 2 }	; # Project for function w/ tuple return


 # Project and remove columns.
 #
 ? [db eval { T % * !x }]	   { 4 9 }
 ? [db eval { T %   !x }]	   { 4 9 }
 ? [db eval { T % y  * }]	   { 4 1 9 5 }

 db eval { T += y ? % 4 as x 8 as y }			; # join on y update x ( no match )
 ? [db eval T] { 1 4 5 9 }

# db +ast { T += y ? % 4 as x 9 as y }			; # join on y update x
# db +sql { T += y ? % 4 as x 9 as y }			; # join on y update x
 db eval { T += y ? % 4 as x 9 as y }			; # join on y update x
 ? [db eval T] { 1 4 4 9 }

