#!/home/john/bin/tclkit8.6
#
# Here is a little command line interface to run from the shell.
#
package require starkit


if { [starkit::startup] ne "sourced" } {
    ::tcl::tm::path add $::starkit::topdir/modules

    package require isbl 1

    isbl create db [lindex $argv 0]

    if { [lindex $argv 0] eq {} } {
	puts stderr "isbl <db> <isbl expression> \[script]"
	exit
    }
    try {
	set reply [db {*}[lrange $argv 1 end]]

	if { $reply != {} } { puts $reply }

    } on error message { puts $message }
}


