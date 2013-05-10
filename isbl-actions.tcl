 method Phrase { start end args } {
	    set reply {}
	    foreach arg $args { append reply [my {*}$arg] }
	    set reply
      	}
 
 method RelValue { start end args } {
	    set reply {}
	    foreach arg $args { append reply [my {*}$arg] }
	    set reply
      	}
 
 method RelExpr { start end args } {
	    set reply {}
	    foreach arg $args { append reply [my {*}$arg] }
	    set reply
      	}
 
 method ProjOp { start end      } {
	    string range $string $start $end
	}
 
 method Column { start end      } {
	    string range $string $start $end
	}
 
 method InArgs { start end      } {
	    string range $string $start $end
	}
 
 method OutArgs { start end      } {
	    string range $string $start $end
	}
 
 method SelOp { start end      } {
	    string range $string $start $end
	}
 
 method SelExpr { start end      } {
	    string range $string $start $end
	}
 
 method JoinOp { start end      } {
	    string range $string $start $end
	}
 
 method SumOp { start end      } {
	    string range $string $start $end
	}
 
 method AssOp { start end      } {
	    string range $string $start $end
	}
 
 method Comma { start end      } {
	    string range $string $start $end
	}
 
 method Equ { start end      } {
	    string range $string $start $end
	}
 
 method RP { start end      } {
	    string range $string $start $end
	}
 
 method LP { start end      } {
	    string range $string $start $end
	}
 
 method Value { start end args } {
	    set reply {}
	    foreach arg $args { append reply [my {*}$arg] }
	    set reply
      	}
 
 method Func { start end      } {
	    string range $string $start $end
	}
 
 method Args { start end args } {
	    set reply {}
	    foreach arg $args { append reply [my {*}$arg] }
	    set reply
      	}
 
 method StrOp { start end      } {
	    string range $string $start $end
	}
 
 method StrExpr { start end args } {
	    set reply {}
	    foreach arg $args { append reply [my {*}$arg] }
	    set reply
      	}
 
 method MulOp { start end      } {
	    string range $string $start $end
	}
 
 method MulExpr { start end args } {
	    set reply {}
	    foreach arg $args { append reply [my {*}$arg] }
	    set reply
      	}
 
 method AddOp { start end      } {
	    string range $string $start $end
	}
 
 method AddExpr { start end args } {
	    set reply {}
	    foreach arg $args { append reply [my {*}$arg] }
	    set reply
      	}
 
 method BitOp { start end      } {
	    string range $string $start $end
	}
 
 method BitExpr { start end args } {
	    set reply {}
	    foreach arg $args { append reply [my {*}$arg] }
	    set reply
      	}
 
 method CmpOp { start end      } {
	    string range $string $start $end
	}
 
 method CmpExpr { start end args } {
	    set reply {}
	    foreach arg $args { append reply [my {*}$arg] }
	    set reply
      	}
 
 method AndOp { start end      } {
	    string range $string $start $end
	}
 
 method AndExpr { start end args } {
	    set reply {}
	    foreach arg $args { append reply [my {*}$arg] }
	    set reply
      	}
 
 method OrOp { start end      } {
	    string range $string $start $end
	}
 
 method OrExpr { start end args } {
	    set reply {}
	    foreach arg $args { append reply [my {*}$arg] }
	    set reply
      	}
 
 method Expr { start end args } {
	    set reply {}
	    foreach arg $args { append reply [my {*}$arg] }
	    set reply
      	}
 
 method NULL { start end      } {
	    string range $string $start $end
	}
 
 method Name { start end      } {
	    string range $string $start $end
	}
 

