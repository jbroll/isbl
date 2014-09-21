## -*- tcl -*-
##
## Snit-based Tcl/PARAM implementation of the parsing
## expression grammar
##
##	isbl-parser
##
## Generated from file	isbl-parser.peg
##            for user  unknown
##
# # ## ### ##### ######## ############# #####################
## Requirements

package require Tcl 8.5
package require snit
package require pt::rde ; # Implementation of the PARAM
			  # virtual machine underlying the
			  # Tcl/PARAM code used below.

# # ## ### ##### ######## ############# #####################
##

snit::type ::isbl-parser {
    # # ## ### ##### ######## #############
    ## Public API

    constructor {} {
	# Create the runtime supporting the parsing process.
	set myparser [pt::rde ${selfns}::ENGINE]
	return
    }

    method parse {channel} {
	$myparser reset $channel
	MAIN ; # Entrypoint for the generated code.
	return [$myparser complete]
    }

    method parset {text} {
	$myparser reset
	$myparser data $text
	MAIN ; # Entrypoint for the generated code.
	return [$myparser complete]
    }

    # # ## ### ###### ######## #############
    ## Configuration

    pragma -hastypeinfo    0
    pragma -hastypemethods 0
    pragma -hasinfo        0
    pragma -simpledispatch 1

    # # ## ### ###### ######## #############
    ## Data structures.

    variable myparser {} ; # Our instantiation of the PARAM.

    # # ## ### ###### ######## #############
    ## BEGIN of GENERATED CODE. DO NOT EDIT.

    #
    # Grammar Start Expression
    #
    
    proc MAIN {} { upvar 1 myparser myparser
        sym_Phrase
        return
    }
    
    #
    # value Symbol 'AddExpr'
    #
    
    proc sym_AddExpr {} { upvar 1 myparser myparser
        # x
        #     (MulExpr)
        #     (WS)
        #     *
        #         x
        #             (AddOp)
        #             (WS)
        #             (MulExpr)
    
        $myparser si:value_symbol_start AddExpr
        sequence_11
        $myparser si:reduce_symbol_end AddExpr
        return
    }
    
    proc sequence_11 {} { upvar 1 myparser myparser
        # x
        #     (MulExpr)
        #     (WS)
        #     *
        #         x
        #             (AddOp)
        #             (WS)
        #             (MulExpr)
    
        $myparser si:value_state_push
        sym_MulExpr
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        kleene_9
        $myparser si:value_state_merge
        return
    }
    
    proc kleene_9 {} { upvar 1 myparser myparser
        # *
        #     x
        #         (AddOp)
        #         (WS)
        #         (MulExpr)
    
        while {1} {
            $myparser si:void2_state_push
        sequence_7
            $myparser si:kleene_close
        }
        return
    }
    
    proc sequence_7 {} { upvar 1 myparser myparser
        # x
        #     (AddOp)
        #     (WS)
        #     (MulExpr)
    
        $myparser si:value_state_push
        sym_AddOp
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        sym_MulExpr
        $myparser si:value_state_merge
        return
    }
    
    #
    # value Symbol 'AddOp'
    #
    
    proc sym_AddOp {} { upvar 1 myparser myparser
        # [+-]
    
        $myparser si:void_symbol_start AddOp
        $myparser si:next_class +-
        $myparser si:void_leaf_symbol_end AddOp
        return
    }
    
    #
    # value Symbol 'AndExpr'
    #
    
    proc sym_AndExpr {} { upvar 1 myparser myparser
        # x
        #     (CmpExpr)
        #     (WS)
        #     *
        #         x
        #             (AndOp)
        #             (WS)
        #             (CmpExpr)
    
        $myparser si:value_symbol_start AndExpr
        sequence_25
        $myparser si:reduce_symbol_end AndExpr
        return
    }
    
    proc sequence_25 {} { upvar 1 myparser myparser
        # x
        #     (CmpExpr)
        #     (WS)
        #     *
        #         x
        #             (AndOp)
        #             (WS)
        #             (CmpExpr)
    
        $myparser si:value_state_push
        sym_CmpExpr
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        kleene_23
        $myparser si:value_state_merge
        return
    }
    
    proc kleene_23 {} { upvar 1 myparser myparser
        # *
        #     x
        #         (AndOp)
        #         (WS)
        #         (CmpExpr)
    
        while {1} {
            $myparser si:void2_state_push
        sequence_21
            $myparser si:kleene_close
        }
        return
    }
    
    proc sequence_21 {} { upvar 1 myparser myparser
        # x
        #     (AndOp)
        #     (WS)
        #     (CmpExpr)
    
        $myparser si:value_state_push
        sym_AndOp
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        sym_CmpExpr
        $myparser si:value_state_merge
        return
    }
    
    #
    # value Symbol 'AndOp'
    #
    
    proc sym_AndOp {} { upvar 1 myparser myparser
        # /
        #     "AND"
        #     "and"
    
        $myparser si:void_symbol_start AndOp
        choice_30
        $myparser si:void_leaf_symbol_end AndOp
        return
    }
    
    proc choice_30 {} { upvar 1 myparser myparser
        # /
        #     "AND"
        #     "and"
    
        $myparser si:void_state_push
        $myparser si:next_str AND
        $myparser si:voidvoid_branch
        $myparser si:next_str and
        $myparser si:void_state_merge
        return
    }
    
    #
    # value Symbol 'Args'
    #
    
    proc sym_Args {} { upvar 1 myparser myparser
        # x
        #     (Expr)
        #     *
        #         x
        #             ','
        #             (Expr)
    
        $myparser si:value_symbol_start Args
        sequence_40
        $myparser si:reduce_symbol_end Args
        return
    }
    
    proc sequence_40 {} { upvar 1 myparser myparser
        # x
        #     (Expr)
        #     *
        #         x
        #             ','
        #             (Expr)
    
        $myparser si:value_state_push
        sym_Expr
        $myparser si:valuevalue_part
        kleene_38
        $myparser si:value_state_merge
        return
    }
    
    proc kleene_38 {} { upvar 1 myparser myparser
        # *
        #     x
        #         ','
        #         (Expr)
    
        while {1} {
            $myparser si:void2_state_push
        sequence_36
            $myparser si:kleene_close
        }
        return
    }
    
    proc sequence_36 {} { upvar 1 myparser myparser
        # x
        #     ','
        #     (Expr)
    
        $myparser si:void_state_push
        $myparser si:next_char ,
        $myparser si:voidvalue_part
        sym_Expr
        $myparser si:value_state_merge
        return
    }
    
    #
    # value Symbol 'Assign'
    #
    
    proc sym_Assign {} { upvar 1 myparser myparser
        # /
        #     x
        #         (Table)
        #         (WS)
        #         (UpdOp)
        #         (WS)
        #         (Cols)
        #         (WS)
        #         '?'
        #         (WS)
        #         (RelExpr)
        #     x
        #         (Table)
        #         (WS)
        #         (AssOp)
        #         (WS)
        #         (RelExpr)
    
        $myparser si:value_symbol_start Assign
        choice_61
        $myparser si:reduce_symbol_end Assign
        return
    }
    
    proc choice_61 {} { upvar 1 myparser myparser
        # /
        #     x
        #         (Table)
        #         (WS)
        #         (UpdOp)
        #         (WS)
        #         (Cols)
        #         (WS)
        #         '?'
        #         (WS)
        #         (RelExpr)
        #     x
        #         (Table)
        #         (WS)
        #         (AssOp)
        #         (WS)
        #         (RelExpr)
    
        $myparser si:value_state_push
        sequence_52
        $myparser si:valuevalue_branch
        sequence_59
        $myparser si:value_state_merge
        return
    }
    
    proc sequence_52 {} { upvar 1 myparser myparser
        # x
        #     (Table)
        #     (WS)
        #     (UpdOp)
        #     (WS)
        #     (Cols)
        #     (WS)
        #     '?'
        #     (WS)
        #     (RelExpr)
    
        $myparser si:value_state_push
        sym_Table
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        sym_UpdOp
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        sym_Cols
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        $myparser si:next_char ?
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        sym_RelExpr
        $myparser si:value_state_merge
        return
    }
    
    proc sequence_59 {} { upvar 1 myparser myparser
        # x
        #     (Table)
        #     (WS)
        #     (AssOp)
        #     (WS)
        #     (RelExpr)
    
        $myparser si:value_state_push
        sym_Table
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        sym_AssOp
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        sym_RelExpr
        $myparser si:value_state_merge
        return
    }
    
    #
    # value Symbol 'AssOp'
    #
    
    proc sym_AssOp {} { upvar 1 myparser myparser
        # /
        #     '='
        #     "+="
        #     "-="
        #     ":="
    
        $myparser si:void_symbol_start AssOp
        choice_68
        $myparser si:void_leaf_symbol_end AssOp
        return
    }
    
    proc choice_68 {} { upvar 1 myparser myparser
        # /
        #     '='
        #     "+="
        #     "-="
        #     ":="
    
        $myparser si:void_state_push
        $myparser si:next_char =
        $myparser si:voidvoid_branch
        $myparser si:next_str +=
        $myparser si:voidvoid_branch
        $myparser si:next_str -=
        $myparser si:voidvoid_branch
        $myparser si:next_str :=
        $myparser si:void_state_merge
        return
    }
    
    #
    # value Symbol 'BitExpr'
    #
    
    proc sym_BitExpr {} { upvar 1 myparser myparser
        # x
        #     (AddExpr)
        #     (WS)
        #     *
        #         x
        #             (BitOp)
        #             (WS)
        #             (AddExpr)
    
        $myparser si:value_symbol_start BitExpr
        sequence_80
        $myparser si:reduce_symbol_end BitExpr
        return
    }
    
    proc sequence_80 {} { upvar 1 myparser myparser
        # x
        #     (AddExpr)
        #     (WS)
        #     *
        #         x
        #             (BitOp)
        #             (WS)
        #             (AddExpr)
    
        $myparser si:value_state_push
        sym_AddExpr
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        kleene_78
        $myparser si:value_state_merge
        return
    }
    
    proc kleene_78 {} { upvar 1 myparser myparser
        # *
        #     x
        #         (BitOp)
        #         (WS)
        #         (AddExpr)
    
        while {1} {
            $myparser si:void2_state_push
        sequence_76
            $myparser si:kleene_close
        }
        return
    }
    
    proc sequence_76 {} { upvar 1 myparser myparser
        # x
        #     (BitOp)
        #     (WS)
        #     (AddExpr)
    
        $myparser si:value_state_push
        sym_BitOp
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        sym_AddExpr
        $myparser si:value_state_merge
        return
    }
    
    #
    # value Symbol 'BitOp'
    #
    
    proc sym_BitOp {} { upvar 1 myparser myparser
        # /
        #     "<<"
        #     ">>"
        #     [&|]
    
        $myparser si:void_symbol_start BitOp
        choice_86
        $myparser si:void_leaf_symbol_end BitOp
        return
    }
    
    proc choice_86 {} { upvar 1 myparser myparser
        # /
        #     "<<"
        #     ">>"
        #     [&|]
    
        $myparser si:void_state_push
        $myparser si:next_str <<
        $myparser si:voidvoid_branch
        $myparser si:next_str >>
        $myparser si:voidvoid_branch
        $myparser si:next_class &|
        $myparser si:void_state_merge
        return
    }
    
    #
    # leaf Symbol 'CAll'
    #
    
    proc sym_CAll {} { upvar 1 myparser myparser
        # '*'
    
        $myparser si:void_symbol_start CAll
        $myparser si:next_char *
        $myparser si:void_leaf_symbol_end CAll
        return
    }
    
    #
    # leaf Symbol 'CDel'
    #
    
    proc sym_CDel {} { upvar 1 myparser myparser
        # (Ident)
    
        $myparser si:value_symbol_start CDel
        sym_Ident
        $myparser si:value_leaf_symbol_end CDel
        return
    }
    
    #
    # value Symbol 'CEqu'
    #
    
    proc sym_CEqu {} { upvar 1 myparser myparser
        # x
        #     (Column)
        #     (WS)
        #     '='
        #     (WS)
        #     (Expr)
    
        $myparser si:value_symbol_start CEqu
        sequence_98
        $myparser si:reduce_symbol_end CEqu
        return
    }
    
    proc sequence_98 {} { upvar 1 myparser myparser
        # x
        #     (Column)
        #     (WS)
        #     '='
        #     (WS)
        #     (Expr)
    
        $myparser si:value_state_push
        sym_Column
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        $myparser si:next_char =
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        sym_Expr
        $myparser si:value_state_merge
        return
    }
    
    #
    # value Symbol 'CFunc'
    #
    
    proc sym_CFunc {} { upvar 1 myparser myparser
        # x
        #     (Name)
        #     (WS)
        #     '\('
        #     (WS)
        #     ?
        #         (InArgs)
        #     (WS)
        #     '|'
        #     (WS)
        #     (OutArgs)
        #     (WS)
        #     '\)'
        #     (WS)
    
        $myparser si:value_symbol_start CFunc
        sequence_115
        $myparser si:reduce_symbol_end CFunc
        return
    }
    
    proc sequence_115 {} { upvar 1 myparser myparser
        # x
        #     (Name)
        #     (WS)
        #     '\('
        #     (WS)
        #     ?
        #         (InArgs)
        #     (WS)
        #     '|'
        #     (WS)
        #     (OutArgs)
        #     (WS)
        #     '\)'
        #     (WS)
    
        $myparser si:value_state_push
        sym_Name
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        $myparser si:next_char \50
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        optional_106
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        $myparser si:next_char |
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        sym_OutArgs
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        $myparser si:next_char \51
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:value_state_merge
        return
    }
    
    proc optional_106 {} { upvar 1 myparser myparser
        # ?
        #     (InArgs)
    
        $myparser si:void2_state_push
        sym_InArgs
        $myparser si:void_state_merge_ok
        return
    }
    
    #
    # value Symbol 'CMap'
    #
    
    proc sym_CMap {} { upvar 1 myparser myparser
        # x
        #     (Expr)
        #     (WS)
        #     (MapOp)
        #     (WS)
        #     (Column)
    
        $myparser si:value_symbol_start CMap
        sequence_123
        $myparser si:reduce_symbol_end CMap
        return
    }
    
    proc sequence_123 {} { upvar 1 myparser myparser
        # x
        #     (Expr)
        #     (WS)
        #     (MapOp)
        #     (WS)
        #     (Column)
    
        $myparser si:value_state_push
        sym_Expr
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        sym_MapOp
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        sym_Column
        $myparser si:value_state_merge
        return
    }
    
    #
    # value Symbol 'CmpExpr'
    #
    
    proc sym_CmpExpr {} { upvar 1 myparser myparser
        # x
        #     (BitExpr)
        #     (WS)
        #     *
        #         x
        #             (CmpOp)
        #             (WS)
        #             (BitExpr)
    
        $myparser si:value_symbol_start CmpExpr
        sequence_135
        $myparser si:reduce_symbol_end CmpExpr
        return
    }
    
    proc sequence_135 {} { upvar 1 myparser myparser
        # x
        #     (BitExpr)
        #     (WS)
        #     *
        #         x
        #             (CmpOp)
        #             (WS)
        #             (BitExpr)
    
        $myparser si:value_state_push
        sym_BitExpr
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        kleene_133
        $myparser si:value_state_merge
        return
    }
    
    proc kleene_133 {} { upvar 1 myparser myparser
        # *
        #     x
        #         (CmpOp)
        #         (WS)
        #         (BitExpr)
    
        while {1} {
            $myparser si:void2_state_push
        sequence_131
            $myparser si:kleene_close
        }
        return
    }
    
    proc sequence_131 {} { upvar 1 myparser myparser
        # x
        #     (CmpOp)
        #     (WS)
        #     (BitExpr)
    
        $myparser si:value_state_push
        sym_CmpOp
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        sym_BitExpr
        $myparser si:value_state_merge
        return
    }
    
    #
    # value Symbol 'CmpOp'
    #
    
    proc sym_CmpOp {} { upvar 1 myparser myparser
        # /
        #     '<'
        #     "<="
        #     '>'
        #     ">=="
        #     "=="
        #     "!="
        #     "<>IS"
        #     "IS<blank>NOT"
        #     "IN"
        #     "LIKEis"
        #     "is<blank>not"
        #     "in"
        #     "likeGLOB"
        #     "MATCH"
        #     "REGEXPglob"
        #     "match"
        #     "regexp"
    
        $myparser si:void_symbol_start CmpOp
        choice_155
        $myparser si:void_leaf_symbol_end CmpOp
        return
    }
    
    proc choice_155 {} { upvar 1 myparser myparser
        # /
        #     '<'
        #     "<="
        #     '>'
        #     ">=="
        #     "=="
        #     "!="
        #     "<>IS"
        #     "IS<blank>NOT"
        #     "IN"
        #     "LIKEis"
        #     "is<blank>not"
        #     "in"
        #     "likeGLOB"
        #     "MATCH"
        #     "REGEXPglob"
        #     "match"
        #     "regexp"
    
        $myparser si:void_state_push
        $myparser si:next_char <
        $myparser si:voidvoid_branch
        $myparser si:next_str <=
        $myparser si:voidvoid_branch
        $myparser si:next_char >
        $myparser si:voidvoid_branch
        $myparser si:next_str >==
        $myparser si:voidvoid_branch
        $myparser si:next_str ==
        $myparser si:voidvoid_branch
        $myparser si:next_str !=
        $myparser si:voidvoid_branch
        $myparser si:next_str <>IS
        $myparser si:voidvoid_branch
        $myparser si:next_str IS\40NOT
        $myparser si:voidvoid_branch
        $myparser si:next_str IN
        $myparser si:voidvoid_branch
        $myparser si:next_str LIKEis
        $myparser si:voidvoid_branch
        $myparser si:next_str is\40not
        $myparser si:voidvoid_branch
        $myparser si:next_str in
        $myparser si:voidvoid_branch
        $myparser si:next_str likeGLOB
        $myparser si:voidvoid_branch
        $myparser si:next_str MATCH
        $myparser si:voidvoid_branch
        $myparser si:next_str REGEXPglob
        $myparser si:voidvoid_branch
        $myparser si:next_str match
        $myparser si:voidvoid_branch
        $myparser si:next_str regexp
        $myparser si:void_state_merge
        return
    }
    
    #
    # leaf Symbol 'CName'
    #
    
    proc sym_CName {} { upvar 1 myparser myparser
        # (Ident)
    
        $myparser si:value_symbol_start CName
        sym_Ident
        $myparser si:value_leaf_symbol_end CName
        return
    }
    
    #
    # value Symbol 'Col'
    #
    
    proc sym_Col {} { upvar 1 myparser myparser
        # /
        #     (CFunc)
        #     (CMap)
        #     (CEqu)
        #     x
        #         '!'
        #         (WS)
        #         (CDel)
        #     (CName)
        #     (CAll)
    
        $myparser si:value_symbol_start Col
        choice_170
        $myparser si:reduce_symbol_end Col
        return
    }
    
    proc choice_170 {} { upvar 1 myparser myparser
        # /
        #     (CFunc)
        #     (CMap)
        #     (CEqu)
        #     x
        #         '!'
        #         (WS)
        #         (CDel)
        #     (CName)
        #     (CAll)
    
        $myparser si:value_state_push
        sym_CFunc
        $myparser si:valuevalue_branch
        sym_CMap
        $myparser si:valuevalue_branch
        sym_CEqu
        $myparser si:valuevalue_branch
        sequence_166
        $myparser si:valuevalue_branch
        sym_CName
        $myparser si:valuevalue_branch
        sym_CAll
        $myparser si:value_state_merge
        return
    }
    
    proc sequence_166 {} { upvar 1 myparser myparser
        # x
        #     '!'
        #     (WS)
        #     (CDel)
    
        $myparser si:void_state_push
        $myparser si:next_char !
        $myparser si:voidvoid_part
        sym_WS
        $myparser si:voidvalue_part
        sym_CDel
        $myparser si:value_state_merge
        return
    }
    
    #
    # value Symbol 'Cols'
    #
    
    proc sym_Cols {} { upvar 1 myparser myparser
        # x
        #     (Col)
        #     *
        #         x
        #             (WS)
        #             ?
        #                 ','
        #             (WS)
        #             (Col)
    
        $myparser si:value_symbol_start Cols
        sequence_184
        $myparser si:reduce_symbol_end Cols
        return
    }
    
    proc sequence_184 {} { upvar 1 myparser myparser
        # x
        #     (Col)
        #     *
        #         x
        #             (WS)
        #             ?
        #                 ','
        #             (WS)
        #             (Col)
    
        $myparser si:value_state_push
        sym_Col
        $myparser si:valuevalue_part
        kleene_182
        $myparser si:value_state_merge
        return
    }
    
    proc kleene_182 {} { upvar 1 myparser myparser
        # *
        #     x
        #         (WS)
        #         ?
        #             ','
        #         (WS)
        #         (Col)
    
        while {1} {
            $myparser si:void2_state_push
        sequence_180
            $myparser si:kleene_close
        }
        return
    }
    
    proc sequence_180 {} { upvar 1 myparser myparser
        # x
        #     (WS)
        #     ?
        #         ','
        #     (WS)
        #     (Col)
    
        $myparser si:void_state_push
        sym_WS
        $myparser si:voidvoid_part
        optional_176
        $myparser si:voidvoid_part
        sym_WS
        $myparser si:voidvalue_part
        sym_Col
        $myparser si:value_state_merge
        return
    }
    
    proc optional_176 {} { upvar 1 myparser myparser
        # ?
        #     ','
    
        $myparser si:void2_state_push
        $myparser si:next_char ,
        $myparser si:void_state_merge_ok
        return
    }
    
    #
    # leaf Symbol 'Column'
    #
    
    proc sym_Column {} { upvar 1 myparser myparser
        # (Ident)
    
        $myparser si:value_symbol_start Column
        sym_Ident
        $myparser si:value_leaf_symbol_end Column
        return
    }
    
    #
    # value Symbol 'Comma'
    #
    
    proc sym_Comma {} { upvar 1 myparser myparser
        # ','
    
        $myparser si:void_symbol_start Comma
        $myparser si:next_char ,
        $myparser si:void_leaf_symbol_end Comma
        return
    }
    
    #
    # value Symbol 'EOF'
    #
    
    proc sym_EOF {} { upvar 1 myparser myparser
        # !
        #     <dot>
    
        $myparser si:void_symbol_start EOF
        notahead_192
        $myparser si:void_leaf_symbol_end EOF
        return
    }
    
    proc notahead_192 {} { upvar 1 myparser myparser
        # !
        #     <dot>
    
        $myparser i_loc_push
        $myparser i_input_next dot
        $myparser si:void_notahead_exit
        return
    }
    
    #
    # value Symbol 'Equ'
    #
    
    proc sym_Equ {} { upvar 1 myparser myparser
        # '='
    
        $myparser si:void_symbol_start Equ
        $myparser si:next_char =
        $myparser si:void_leaf_symbol_end Equ
        return
    }
    
    #
    # value Symbol 'Expr'
    #
    
    proc sym_Expr {} { upvar 1 myparser myparser
        # (OrExpr)
    
        $myparser si:value_symbol_start Expr
        sym_OrExpr
        $myparser si:reduce_symbol_end Expr
        return
    }
    
    #
    # value Symbol 'Frac'
    #
    
    proc sym_Frac {} { upvar 1 myparser myparser
        # x
        #     '.'
        #     *
        #         <ddigit>
    
        $myparser si:void_symbol_start Frac
        sequence_203
        $myparser si:void_leaf_symbol_end Frac
        return
    }
    
    proc sequence_203 {} { upvar 1 myparser myparser
        # x
        #     '.'
        #     *
        #         <ddigit>
    
        $myparser si:void_state_push
        $myparser si:next_char .
        $myparser si:voidvoid_part
        kleene_201
        $myparser si:void_state_merge
        return
    }
    
    proc kleene_201 {} { upvar 1 myparser myparser
        # *
        #     <ddigit>
    
        while {1} {
            $myparser si:void2_state_push
        $myparser si:next_ddigit
            $myparser si:kleene_close
        }
        return
    }
    
    #
    # leaf Symbol 'Func'
    #
    
    proc sym_Func {} { upvar 1 myparser myparser
        # x
        #     (Name)
        #     (RP)
        #     ?
        #         (Args)
        #     (LP)
    
        $myparser si:value_symbol_start Func
        sequence_212
        $myparser si:value_leaf_symbol_end Func
        return
    }
    
    proc sequence_212 {} { upvar 1 myparser myparser
        # x
        #     (Name)
        #     (RP)
        #     ?
        #         (Args)
        #     (LP)
    
        $myparser si:value_state_push
        sym_Name
        $myparser si:valuevalue_part
        sym_RP
        $myparser si:valuevalue_part
        optional_209
        $myparser si:valuevalue_part
        sym_LP
        $myparser si:value_state_merge
        return
    }
    
    proc optional_209 {} { upvar 1 myparser myparser
        # ?
        #     (Args)
    
        $myparser si:void2_state_push
        sym_Args
        $myparser si:void_state_merge_ok
        return
    }
    
    #
    # value Symbol 'Ident'
    #
    
    proc sym_Ident {} { upvar 1 myparser myparser
        # x
        #     <alpha>
        #     *
        #         [_A Za z0 9]
    
        $myparser si:void_symbol_start Ident
        sequence_219
        $myparser si:void_leaf_symbol_end Ident
        return
    }
    
    proc sequence_219 {} { upvar 1 myparser myparser
        # x
        #     <alpha>
        #     *
        #         [_A Za z0 9]
    
        $myparser si:void_state_push
        $myparser si:next_alpha
        $myparser si:voidvoid_part
        kleene_217
        $myparser si:void_state_merge
        return
    }
    
    proc kleene_217 {} { upvar 1 myparser myparser
        # *
        #     [_A Za z0 9]
    
        while {1} {
            $myparser si:void2_state_push
        $myparser si:next_class _ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789
            $myparser si:kleene_close
        }
        return
    }
    
    #
    # leaf Symbol 'InArgs'
    #
    
    proc sym_InArgs {} { upvar 1 myparser myparser
        # ?
        #     x
        #         (Value)
        #         (WS)
        #         *
        #             x
        #                 ','
        #                 (WS)
        #                 (Value)
    
        $myparser si:value_symbol_start InArgs
        optional_233
        $myparser si:value_leaf_symbol_end InArgs
        return
    }
    
    proc optional_233 {} { upvar 1 myparser myparser
        # ?
        #     x
        #         (Value)
        #         (WS)
        #         *
        #             x
        #                 ','
        #                 (WS)
        #                 (Value)
    
        $myparser si:void2_state_push
        sequence_231
        $myparser si:void_state_merge_ok
        return
    }
    
    proc sequence_231 {} { upvar 1 myparser myparser
        # x
        #     (Value)
        #     (WS)
        #     *
        #         x
        #             ','
        #             (WS)
        #             (Value)
    
        $myparser si:value_state_push
        sym_Value
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        kleene_229
        $myparser si:value_state_merge
        return
    }
    
    proc kleene_229 {} { upvar 1 myparser myparser
        # *
        #     x
        #         ','
        #         (WS)
        #         (Value)
    
        while {1} {
            $myparser si:void2_state_push
        sequence_227
            $myparser si:kleene_close
        }
        return
    }
    
    proc sequence_227 {} { upvar 1 myparser myparser
        # x
        #     ','
        #     (WS)
        #     (Value)
    
        $myparser si:void_state_push
        $myparser si:next_char ,
        $myparser si:voidvoid_part
        sym_WS
        $myparser si:voidvalue_part
        sym_Value
        $myparser si:value_state_merge
        return
    }
    
    #
    # value Symbol 'Int'
    #
    
    proc sym_Int {} { upvar 1 myparser myparser
        # x
        #     ?
        #         (Sign)
        #     +
        #         <ddigit>
    
        $myparser si:value_symbol_start Int
        sequence_242
        $myparser si:reduce_symbol_end Int
        return
    }
    
    proc sequence_242 {} { upvar 1 myparser myparser
        # x
        #     ?
        #         (Sign)
        #     +
        #         <ddigit>
    
        $myparser si:value_state_push
        optional_237
        $myparser si:valuevalue_part
        poskleene_240
        $myparser si:value_state_merge
        return
    }
    
    proc optional_237 {} { upvar 1 myparser myparser
        # ?
        #     (Sign)
    
        $myparser si:void2_state_push
        sym_Sign
        $myparser si:void_state_merge_ok
        return
    }
    
    proc poskleene_240 {} { upvar 1 myparser myparser
        # +
        #     <ddigit>
    
        $myparser i_loc_push
        $myparser si:next_ddigit
        $myparser si:kleene_abort
        while {1} {
            $myparser si:void2_state_push
        $myparser si:next_ddigit
            $myparser si:kleene_close
        }
        return
    }
    
    #
    # value Symbol 'Join'
    #
    
    proc sym_Join {} { upvar 1 myparser myparser
        # x
        #     (Select)
        #     (WS)
        #     *
        #         x
        #             (JoinOp)
        #             (WS)
        #             (Select)
    
        $myparser si:value_symbol_start Join
        sequence_254
        $myparser si:reduce_symbol_end Join
        return
    }
    
    proc sequence_254 {} { upvar 1 myparser myparser
        # x
        #     (Select)
        #     (WS)
        #     *
        #         x
        #             (JoinOp)
        #             (WS)
        #             (Select)
    
        $myparser si:value_state_push
        sym_Select
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        kleene_252
        $myparser si:value_state_merge
        return
    }
    
    proc kleene_252 {} { upvar 1 myparser myparser
        # *
        #     x
        #         (JoinOp)
        #         (WS)
        #         (Select)
    
        while {1} {
            $myparser si:void2_state_push
        sequence_250
            $myparser si:kleene_close
        }
        return
    }
    
    proc sequence_250 {} { upvar 1 myparser myparser
        # x
        #     (JoinOp)
        #     (WS)
        #     (Select)
    
        $myparser si:value_state_push
        sym_JoinOp
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        sym_Select
        $myparser si:value_state_merge
        return
    }
    
    #
    # value Symbol 'JoinOp'
    #
    
    proc sym_JoinOp {} { upvar 1 myparser myparser
        # [*/]
    
        $myparser si:void_symbol_start JoinOp
        $myparser si:next_class */
        $myparser si:void_leaf_symbol_end JoinOp
        return
    }
    
    #
    # value Symbol 'LP'
    #
    
    proc sym_LP {} { upvar 1 myparser myparser
        # '\)'
    
        $myparser si:void_symbol_start LP
        $myparser si:next_char \51
        $myparser si:void_leaf_symbol_end LP
        return
    }
    
    #
    # void Symbol 'MapOp'
    #
    
    proc sym_MapOp {} { upvar 1 myparser myparser
        # /
        #     "->"
        #     "as"
    
        $myparser si:void_void_symbol_start MapOp
        choice_263
        $myparser si:void_clear_symbol_end MapOp
        return
    }
    
    proc choice_263 {} { upvar 1 myparser myparser
        # /
        #     "->"
        #     "as"
    
        $myparser si:void_state_push
        $myparser si:next_str ->
        $myparser si:voidvoid_branch
        $myparser si:next_str as
        $myparser si:void_state_merge
        return
    }
    
    #
    # value Symbol 'MulExpr'
    #
    
    proc sym_MulExpr {} { upvar 1 myparser myparser
        # x
        #     (StrExpr)
        #     (WS)
        #     *
        #         x
        #             (MulOp)
        #             (WS)
        #             (StrExpr)
    
        $myparser si:value_symbol_start MulExpr
        sequence_275
        $myparser si:reduce_symbol_end MulExpr
        return
    }
    
    proc sequence_275 {} { upvar 1 myparser myparser
        # x
        #     (StrExpr)
        #     (WS)
        #     *
        #         x
        #             (MulOp)
        #             (WS)
        #             (StrExpr)
    
        $myparser si:value_state_push
        sym_StrExpr
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        kleene_273
        $myparser si:value_state_merge
        return
    }
    
    proc kleene_273 {} { upvar 1 myparser myparser
        # *
        #     x
        #         (MulOp)
        #         (WS)
        #         (StrExpr)
    
        while {1} {
            $myparser si:void2_state_push
        sequence_271
            $myparser si:kleene_close
        }
        return
    }
    
    proc sequence_271 {} { upvar 1 myparser myparser
        # x
        #     (MulOp)
        #     (WS)
        #     (StrExpr)
    
        $myparser si:value_state_push
        sym_MulOp
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        sym_StrExpr
        $myparser si:value_state_merge
        return
    }
    
    #
    # value Symbol 'MulOp'
    #
    
    proc sym_MulOp {} { upvar 1 myparser myparser
        # [*/%]
    
        $myparser si:void_symbol_start MulOp
        $myparser si:next_class */%
        $myparser si:void_leaf_symbol_end MulOp
        return
    }
    
    #
    # leaf Symbol 'Name'
    #
    
    proc sym_Name {} { upvar 1 myparser myparser
        # (Ident)
    
        $myparser si:value_symbol_start Name
        sym_Ident
        $myparser si:value_leaf_symbol_end Name
        return
    }
    
    #
    # value Symbol 'NULL'
    #
    
    proc sym_NULL {} { upvar 1 myparser myparser
        # "NULL"
    
        $myparser si:void_symbol_start NULL
        $myparser si:next_str NULL
        $myparser si:void_leaf_symbol_end NULL
        return
    }
    
    #
    # value Symbol 'Number'
    #
    
    proc sym_Number {} { upvar 1 myparser myparser
        # /
        #     (Real)
        #     (Int)
    
        $myparser si:value_symbol_start Number
        choice_286
        $myparser si:reduce_symbol_end Number
        return
    }
    
    proc choice_286 {} { upvar 1 myparser myparser
        # /
        #     (Real)
        #     (Int)
    
        $myparser si:value_state_push
        sym_Real
        $myparser si:valuevalue_branch
        sym_Int
        $myparser si:value_state_merge
        return
    }
    
    #
    # value Symbol 'OrExpr'
    #
    
    proc sym_OrExpr {} { upvar 1 myparser myparser
        # x
        #     (AndExpr)
        #     (WS)
        #     *
        #         x
        #             (OrOp)
        #             (WS)
        #             (AndExpr)
    
        $myparser si:value_symbol_start OrExpr
        sequence_298
        $myparser si:reduce_symbol_end OrExpr
        return
    }
    
    proc sequence_298 {} { upvar 1 myparser myparser
        # x
        #     (AndExpr)
        #     (WS)
        #     *
        #         x
        #             (OrOp)
        #             (WS)
        #             (AndExpr)
    
        $myparser si:value_state_push
        sym_AndExpr
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        kleene_296
        $myparser si:value_state_merge
        return
    }
    
    proc kleene_296 {} { upvar 1 myparser myparser
        # *
        #     x
        #         (OrOp)
        #         (WS)
        #         (AndExpr)
    
        while {1} {
            $myparser si:void2_state_push
        sequence_294
            $myparser si:kleene_close
        }
        return
    }
    
    proc sequence_294 {} { upvar 1 myparser myparser
        # x
        #     (OrOp)
        #     (WS)
        #     (AndExpr)
    
        $myparser si:value_state_push
        sym_OrOp
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        sym_AndExpr
        $myparser si:value_state_merge
        return
    }
    
    #
    # value Symbol 'OrOp'
    #
    
    proc sym_OrOp {} { upvar 1 myparser myparser
        # /
        #     "OR"
        #     "or"
    
        $myparser si:void_symbol_start OrOp
        choice_303
        $myparser si:void_leaf_symbol_end OrOp
        return
    }
    
    proc choice_303 {} { upvar 1 myparser myparser
        # /
        #     "OR"
        #     "or"
    
        $myparser si:void_state_push
        $myparser si:next_str OR
        $myparser si:voidvoid_branch
        $myparser si:next_str or
        $myparser si:void_state_merge
        return
    }
    
    #
    # leaf Symbol 'OutArgs'
    #
    
    proc sym_OutArgs {} { upvar 1 myparser myparser
        # x
        #     (Name)
        #     (WS)
        #     *
        #         x
        #             ','
        #             (WS)
        #             (Name)
    
        $myparser si:value_symbol_start OutArgs
        sequence_315
        $myparser si:value_leaf_symbol_end OutArgs
        return
    }
    
    proc sequence_315 {} { upvar 1 myparser myparser
        # x
        #     (Name)
        #     (WS)
        #     *
        #         x
        #             ','
        #             (WS)
        #             (Name)
    
        $myparser si:value_state_push
        sym_Name
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        kleene_313
        $myparser si:value_state_merge
        return
    }
    
    proc kleene_313 {} { upvar 1 myparser myparser
        # *
        #     x
        #         ','
        #         (WS)
        #         (Name)
    
        while {1} {
            $myparser si:void2_state_push
        sequence_311
            $myparser si:kleene_close
        }
        return
    }
    
    proc sequence_311 {} { upvar 1 myparser myparser
        # x
        #     ','
        #     (WS)
        #     (Name)
    
        $myparser si:void_state_push
        $myparser si:next_char ,
        $myparser si:voidvoid_part
        sym_WS
        $myparser si:voidvalue_part
        sym_Name
        $myparser si:value_state_merge
        return
    }
    
    #
    # value Symbol 'Phrase'
    #
    
    proc sym_Phrase {} { upvar 1 myparser myparser
        # /
        #     x
        #         (WS)
        #         (Assign)
        #         (WS)
        #         (EOF)
        #     x
        #         (WS)
        #         (TopExpr)
        #         (WS)
        #         (EOF)
    
        $myparser si:value_symbol_start Phrase
        choice_330
        $myparser si:reduce_symbol_end Phrase
        return
    }
    
    proc choice_330 {} { upvar 1 myparser myparser
        # /
        #     x
        #         (WS)
        #         (Assign)
        #         (WS)
        #         (EOF)
        #     x
        #         (WS)
        #         (TopExpr)
        #         (WS)
        #         (EOF)
    
        $myparser si:value_state_push
        sequence_322
        $myparser si:valuevalue_branch
        sequence_328
        $myparser si:value_state_merge
        return
    }
    
    proc sequence_322 {} { upvar 1 myparser myparser
        # x
        #     (WS)
        #     (Assign)
        #     (WS)
        #     (EOF)
    
        $myparser si:void_state_push
        sym_WS
        $myparser si:voidvalue_part
        sym_Assign
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        sym_EOF
        $myparser si:value_state_merge
        return
    }
    
    proc sequence_328 {} { upvar 1 myparser myparser
        # x
        #     (WS)
        #     (TopExpr)
        #     (WS)
        #     (EOF)
    
        $myparser si:void_state_push
        sym_WS
        $myparser si:voidvalue_part
        sym_TopExpr
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        sym_EOF
        $myparser si:value_state_merge
        return
    }
    
    #
    # value Symbol 'Project'
    #
    
    proc sym_Project {} { upvar 1 myparser myparser
        # /
        #     (Tupple)
        #     x
        #         (RelValue)
        #         (WS)
        #         *
        #             x
        #                 (ProjOp)
        #                 (WS)
        #                 (Cols)
    
        $myparser si:value_symbol_start Project
        choice_345
        $myparser si:reduce_symbol_end Project
        return
    }
    
    proc choice_345 {} { upvar 1 myparser myparser
        # /
        #     (Tupple)
        #     x
        #         (RelValue)
        #         (WS)
        #         *
        #             x
        #                 (ProjOp)
        #                 (WS)
        #                 (Cols)
    
        $myparser si:value_state_push
        sym_Tupple
        $myparser si:valuevalue_branch
        sequence_343
        $myparser si:value_state_merge
        return
    }
    
    proc sequence_343 {} { upvar 1 myparser myparser
        # x
        #     (RelValue)
        #     (WS)
        #     *
        #         x
        #             (ProjOp)
        #             (WS)
        #             (Cols)
    
        $myparser si:value_state_push
        sym_RelValue
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        kleene_341
        $myparser si:value_state_merge
        return
    }
    
    proc kleene_341 {} { upvar 1 myparser myparser
        # *
        #     x
        #         (ProjOp)
        #         (WS)
        #         (Cols)
    
        while {1} {
            $myparser si:void2_state_push
        sequence_339
            $myparser si:kleene_close
        }
        return
    }
    
    proc sequence_339 {} { upvar 1 myparser myparser
        # x
        #     (ProjOp)
        #     (WS)
        #     (Cols)
    
        $myparser si:value_state_push
        sym_ProjOp
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        sym_Cols
        $myparser si:value_state_merge
        return
    }
    
    #
    # value Symbol 'ProjOp'
    #
    
    proc sym_ProjOp {} { upvar 1 myparser myparser
        # '%'
    
        $myparser si:void_symbol_start ProjOp
        $myparser si:next_char %
        $myparser si:void_leaf_symbol_end ProjOp
        return
    }
    
    #
    # value Symbol 'Real'
    #
    
    proc sym_Real {} { upvar 1 myparser myparser
        # x
        #     ?
        #         (Sign)
        #     ?
        #         +
        #             <ddigit>
        #     (Frac)
    
        $myparser si:value_symbol_start Real
        sequence_357
        $myparser si:reduce_symbol_end Real
        return
    }
    
    proc sequence_357 {} { upvar 1 myparser myparser
        # x
        #     ?
        #         (Sign)
        #     ?
        #         +
        #             <ddigit>
        #     (Frac)
    
        $myparser si:value_state_push
        optional_237
        $myparser si:valuevalue_part
        optional_354
        $myparser si:valuevalue_part
        sym_Frac
        $myparser si:value_state_merge
        return
    }
    
    proc optional_354 {} { upvar 1 myparser myparser
        # ?
        #     +
        #         <ddigit>
    
        $myparser si:void2_state_push
        poskleene_240
        $myparser si:void_state_merge_ok
        return
    }
    
    #
    # value Symbol 'RelExpr'
    #
    
    proc sym_RelExpr {} { upvar 1 myparser myparser
        # (Sum)
    
        $myparser si:value_symbol_start RelExpr
        sym_Sum
        $myparser si:reduce_symbol_end RelExpr
        return
    }
    
    #
    # value Symbol 'RelValue'
    #
    
    proc sym_RelValue {} { upvar 1 myparser myparser
        # /
        #     x
        #         '\('
        #         (WS)
        #         (RelExpr)
        #         (WS)
        #         '\)'
        #     (Table)
    
        $myparser si:value_symbol_start RelValue
        choice_370
        $myparser si:reduce_symbol_end RelValue
        return
    }
    
    proc choice_370 {} { upvar 1 myparser myparser
        # /
        #     x
        #         '\('
        #         (WS)
        #         (RelExpr)
        #         (WS)
        #         '\)'
        #     (Table)
    
        $myparser si:value_state_push
        sequence_367
        $myparser si:valuevalue_branch
        sym_Table
        $myparser si:value_state_merge
        return
    }
    
    proc sequence_367 {} { upvar 1 myparser myparser
        # x
        #     '\('
        #     (WS)
        #     (RelExpr)
        #     (WS)
        #     '\)'
    
        $myparser si:void_state_push
        $myparser si:next_char \50
        $myparser si:voidvoid_part
        sym_WS
        $myparser si:voidvalue_part
        sym_RelExpr
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        $myparser si:next_char \51
        $myparser si:value_state_merge
        return
    }
    
    #
    # value Symbol 'RP'
    #
    
    proc sym_RP {} { upvar 1 myparser myparser
        # '\('
    
        $myparser si:void_symbol_start RP
        $myparser si:next_char \50
        $myparser si:void_leaf_symbol_end RP
        return
    }
    
    #
    # value Symbol 'Select'
    #
    
    proc sym_Select {} { upvar 1 myparser myparser
        # x
        #     (Project)
        #     (WS)
        #     *
        #         x
        #             (SelOp)
        #             (WS)
        #             (SelExpr)
    
        $myparser si:value_symbol_start Select
        sequence_384
        $myparser si:reduce_symbol_end Select
        return
    }
    
    proc sequence_384 {} { upvar 1 myparser myparser
        # x
        #     (Project)
        #     (WS)
        #     *
        #         x
        #             (SelOp)
        #             (WS)
        #             (SelExpr)
    
        $myparser si:value_state_push
        sym_Project
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        kleene_382
        $myparser si:value_state_merge
        return
    }
    
    proc kleene_382 {} { upvar 1 myparser myparser
        # *
        #     x
        #         (SelOp)
        #         (WS)
        #         (SelExpr)
    
        while {1} {
            $myparser si:void2_state_push
        sequence_380
            $myparser si:kleene_close
        }
        return
    }
    
    proc sequence_380 {} { upvar 1 myparser myparser
        # x
        #     (SelOp)
        #     (WS)
        #     (SelExpr)
    
        $myparser si:value_state_push
        sym_SelOp
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        sym_SelExpr
        $myparser si:value_state_merge
        return
    }
    
    #
    # leaf Symbol 'SelExpr'
    #
    
    proc sym_SelExpr {} { upvar 1 myparser myparser
        # (Expr)
    
        $myparser si:value_symbol_start SelExpr
        sym_Expr
        $myparser si:value_leaf_symbol_end SelExpr
        return
    }
    
    #
    # value Symbol 'SelOp'
    #
    
    proc sym_SelOp {} { upvar 1 myparser myparser
        # ':'
    
        $myparser si:void_symbol_start SelOp
        $myparser si:next_char :
        $myparser si:void_leaf_symbol_end SelOp
        return
    }
    
    #
    # value Symbol 'Sign'
    #
    
    proc sym_Sign {} { upvar 1 myparser myparser
        # [+-]
    
        $myparser si:void_symbol_start Sign
        $myparser si:next_class +-
        $myparser si:void_leaf_symbol_end Sign
        return
    }
    
    #
    # value Symbol 'StrExpr'
    #
    
    proc sym_StrExpr {} { upvar 1 myparser myparser
        # x
        #     (Value)
        #     (WS)
        #     *
        #         x
        #             (StrOp)
        #             (WS)
        #             (Value)
    
        $myparser si:value_symbol_start StrExpr
        sequence_402
        $myparser si:reduce_symbol_end StrExpr
        return
    }
    
    proc sequence_402 {} { upvar 1 myparser myparser
        # x
        #     (Value)
        #     (WS)
        #     *
        #         x
        #             (StrOp)
        #             (WS)
        #             (Value)
    
        $myparser si:value_state_push
        sym_Value
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        kleene_400
        $myparser si:value_state_merge
        return
    }
    
    proc kleene_400 {} { upvar 1 myparser myparser
        # *
        #     x
        #         (StrOp)
        #         (WS)
        #         (Value)
    
        while {1} {
            $myparser si:void2_state_push
        sequence_398
            $myparser si:kleene_close
        }
        return
    }
    
    proc sequence_398 {} { upvar 1 myparser myparser
        # x
        #     (StrOp)
        #     (WS)
        #     (Value)
    
        $myparser si:value_state_push
        sym_StrOp
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        sym_Value
        $myparser si:value_state_merge
        return
    }
    
    #
    # leaf Symbol 'String'
    #
    
    proc sym_String {} { upvar 1 myparser myparser
        # /
        #     x
        #         '\"'
        #         *
        #             x
        #                 !
        #                     '\"'
        #                 <dot>
        #         '\"'
        #     x
        #         '''
        #         *
        #             x
        #                 !
        #                     '\"'
        #                 <dot>
        #         '''
    
        $myparser si:void_symbol_start String
        choice_426
        $myparser si:void_leaf_symbol_end String
        return
    }
    
    proc choice_426 {} { upvar 1 myparser myparser
        # /
        #     x
        #         '\"'
        #         *
        #             x
        #                 !
        #                     '\"'
        #                 <dot>
        #         '\"'
        #     x
        #         '''
        #         *
        #             x
        #                 !
        #                     '\"'
        #                 <dot>
        #         '''
    
        $myparser si:void_state_push
        sequence_415
        $myparser si:voidvoid_branch
        sequence_424
        $myparser si:void_state_merge
        return
    }
    
    proc sequence_415 {} { upvar 1 myparser myparser
        # x
        #     '\"'
        #     *
        #         x
        #             !
        #                 '\"'
        #             <dot>
        #     '\"'
    
        $myparser si:void_state_push
        $myparser si:next_char \42
        $myparser si:voidvoid_part
        kleene_412
        $myparser si:voidvoid_part
        $myparser si:next_char \42
        $myparser si:void_state_merge
        return
    }
    
    proc kleene_412 {} { upvar 1 myparser myparser
        # *
        #     x
        #         !
        #             '\"'
        #         <dot>
    
        while {1} {
            $myparser si:void2_state_push
        sequence_410
            $myparser si:kleene_close
        }
        return
    }
    
    proc sequence_410 {} { upvar 1 myparser myparser
        # x
        #     !
        #         '\"'
        #     <dot>
    
        $myparser si:void_state_push
        notahead_407
        $myparser si:voidvoid_part
        $myparser i_input_next dot
        $myparser si:void_state_merge
        return
    }
    
    proc notahead_407 {} { upvar 1 myparser myparser
        # !
        #     '\"'
    
        $myparser i_loc_push
        $myparser si:next_char \42
        $myparser si:void_notahead_exit
        return
    }
    
    proc sequence_424 {} { upvar 1 myparser myparser
        # x
        #     '''
        #     *
        #         x
        #             !
        #                 '\"'
        #             <dot>
        #     '''
    
        $myparser si:void_state_push
        $myparser si:next_char '
        $myparser si:voidvoid_part
        kleene_412
        $myparser si:voidvoid_part
        $myparser si:next_char '
        $myparser si:void_state_merge
        return
    }
    
    #
    # value Symbol 'StrOp'
    #
    
    proc sym_StrOp {} { upvar 1 myparser myparser
        # "||"
    
        $myparser si:void_symbol_start StrOp
        $myparser si:next_str ||
        $myparser si:void_leaf_symbol_end StrOp
        return
    }
    
    #
    # value Symbol 'Sum'
    #
    
    proc sym_Sum {} { upvar 1 myparser myparser
        # x
        #     (Join)
        #     (WS)
        #     *
        #         x
        #             (SumOp)
        #             (WS)
        #             (Join)
    
        $myparser si:value_symbol_start Sum
        sequence_440
        $myparser si:reduce_symbol_end Sum
        return
    }
    
    proc sequence_440 {} { upvar 1 myparser myparser
        # x
        #     (Join)
        #     (WS)
        #     *
        #         x
        #             (SumOp)
        #             (WS)
        #             (Join)
    
        $myparser si:value_state_push
        sym_Join
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        kleene_438
        $myparser si:value_state_merge
        return
    }
    
    proc kleene_438 {} { upvar 1 myparser myparser
        # *
        #     x
        #         (SumOp)
        #         (WS)
        #         (Join)
    
        while {1} {
            $myparser si:void2_state_push
        sequence_436
            $myparser si:kleene_close
        }
        return
    }
    
    proc sequence_436 {} { upvar 1 myparser myparser
        # x
        #     (SumOp)
        #     (WS)
        #     (Join)
    
        $myparser si:value_state_push
        sym_SumOp
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        sym_Join
        $myparser si:value_state_merge
        return
    }
    
    #
    # value Symbol 'SumOp'
    #
    
    proc sym_SumOp {} { upvar 1 myparser myparser
        # [+-.]
    
        $myparser si:void_symbol_start SumOp
        $myparser si:next_class +-.
        $myparser si:void_leaf_symbol_end SumOp
        return
    }
    
    #
    # leaf Symbol 'Table'
    #
    
    proc sym_Table {} { upvar 1 myparser myparser
        # (Ident)
    
        $myparser si:value_symbol_start Table
        sym_Ident
        $myparser si:value_leaf_symbol_end Table
        return
    }
    
    #
    # value Symbol 'TopExpr'
    #
    
    proc sym_TopExpr {} { upvar 1 myparser myparser
        # (RelExpr)
    
        $myparser si:value_symbol_start TopExpr
        sym_RelExpr
        $myparser si:reduce_symbol_end TopExpr
        return
    }
    
    #
    # value Symbol 'Tupple'
    #
    
    proc sym_Tupple {} { upvar 1 myparser myparser
        # x
        #     (ProjOp)
        #     (WS)
        #     (Cols)
    
        $myparser si:value_symbol_start Tupple
        sequence_339
        $myparser si:reduce_symbol_end Tupple
        return
    }
    
    #
    # value Symbol 'UpdOp'
    #
    
    proc sym_UpdOp {} { upvar 1 myparser myparser
        # "+="
    
        $myparser si:void_symbol_start UpdOp
        $myparser si:next_str +=
        $myparser si:void_leaf_symbol_end UpdOp
        return
    }
    
    #
    # value Symbol 'Value'
    #
    
    proc sym_Value {} { upvar 1 myparser myparser
        # /
        #     x
        #         (RP)
        #         (WS)
        #         (Expr)
        #         (WS)
        #         (LP)
        #     (Func)
        #     (NULL)
        #     (Real)
        #     (Int)
        #     (String)
        #     (VName)
    
        $myparser si:value_symbol_start Value
        choice_469
        $myparser si:reduce_symbol_end Value
        return
    }
    
    proc choice_469 {} { upvar 1 myparser myparser
        # /
        #     x
        #         (RP)
        #         (WS)
        #         (Expr)
        #         (WS)
        #         (LP)
        #     (Func)
        #     (NULL)
        #     (Real)
        #     (Int)
        #     (String)
        #     (VName)
    
        $myparser si:value_state_push
        sequence_461
        $myparser si:valuevalue_branch
        sym_Func
        $myparser si:valuevalue_branch
        sym_NULL
        $myparser si:valuevalue_branch
        sym_Real
        $myparser si:valuevalue_branch
        sym_Int
        $myparser si:valuevalue_branch
        sym_String
        $myparser si:valuevalue_branch
        sym_VName
        $myparser si:value_state_merge
        return
    }
    
    proc sequence_461 {} { upvar 1 myparser myparser
        # x
        #     (RP)
        #     (WS)
        #     (Expr)
        #     (WS)
        #     (LP)
    
        $myparser si:value_state_push
        sym_RP
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        sym_Expr
        $myparser si:valuevalue_part
        sym_WS
        $myparser si:valuevalue_part
        sym_LP
        $myparser si:value_state_merge
        return
    }
    
    #
    # leaf Symbol 'VName'
    #
    
    proc sym_VName {} { upvar 1 myparser myparser
        # (Ident)
    
        $myparser si:value_symbol_start VName
        sym_Ident
        $myparser si:value_leaf_symbol_end VName
        return
    }
    
    #
    # void Symbol 'WS'
    #
    
    proc sym_WS {} { upvar 1 myparser myparser
        # *
        #     <space>
    
        $myparser si:void_void_symbol_start WS
        kleene_475
        $myparser si:void_clear_symbol_end WS
        return
    }
    
    proc kleene_475 {} { upvar 1 myparser myparser
        # *
        #     <space>
    
        while {1} {
            $myparser si:void2_state_push
        $myparser si:next_space
            $myparser si:kleene_close
        }
        return
    }
    
    ## END of GENERATED CODE. DO NOT EDIT.
    # # ## ### ###### ######## #############
}

# # ## ### ##### ######## ############# #####################
## Ready

package provide isbl-parser 1

