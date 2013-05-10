
 lappend auto_path /home/john/pkg/tcllib-1.13/modules

 package require TclOO
# package require snit
 package require sqlite3
 package require tcl::chan::events
 package require tcl::chan::string


## -*- tcl -*-
##
## OO-based Tcl/PARAM implementation of the parsing
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
package require TclOO
package require pt::rde::oo ; # OO-based implementation of the
			      # PARAM virtual machine
			      # underlying the Tcl/PARAM code
			      # used below.

# # ## ### ##### ######## ############# #####################
##

oo::class create isbl-parser {
    # # ## ### ##### ######## #############
    ## Public API

    superclass pt::rde::oo ; # TODO - Define this class.
                             # Or can we inherit from a snit
                             # class too ?

    method parse {channel} {
	my reset $channel
	my MAIN ; # Entrypoint for the generated code.
	return [my complete]
    }

    method parset {text} {
	my reset
	my data $text
	my MAIN ; # Entrypoint for the generated code.
	return [my complete]
    }

    # # ## ### ###### ######## #############
    ## BEGIN of GENERATED CODE. DO NOT EDIT.

    #
    # Grammar Start Expression
    #
    
    method MAIN {} {
        my sym_Phrase
        return
    }
    
    #
    # value Symbol 'AddExpr'
    #
    
    method sym_AddExpr {} {
        # x
        #     (MulExpr)
        #     (WS)
        #     *
        #         x
        #             (AddOp)
        #             (WS)
        #             (MulExpr)
    
        my si:value_symbol_start AddExpr
        my sequence_11
        my si:reduce_symbol_end AddExpr
        return
    }
    
    method sequence_11 {} {
        # x
        #     (MulExpr)
        #     (WS)
        #     *
        #         x
        #             (AddOp)
        #             (WS)
        #             (MulExpr)
    
        my si:value_state_push
        my sym_MulExpr
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my kleene_9
        my si:value_state_merge
        return
    }
    
    method kleene_9 {} {
        # *
        #     x
        #         (AddOp)
        #         (WS)
        #         (MulExpr)
    
        while {1} {
            my si:void2_state_push
        my sequence_7
            my si:kleene_close
        }
        return
    }
    
    method sequence_7 {} {
        # x
        #     (AddOp)
        #     (WS)
        #     (MulExpr)
    
        my si:value_state_push
        my sym_AddOp
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my sym_MulExpr
        my si:value_state_merge
        return
    }
    
    #
    # value Symbol 'AddOp'
    #
    
    method sym_AddOp {} {
        # [+-]
    
        my si:void_symbol_start AddOp
        my si:next_class +-
        my si:void_leaf_symbol_end AddOp
        return
    }
    
    #
    # value Symbol 'AndExpr'
    #
    
    method sym_AndExpr {} {
        # x
        #     (CmpExpr)
        #     (WS)
        #     *
        #         x
        #             (AndOp)
        #             (WS)
        #             (CmpExpr)
    
        my si:value_symbol_start AndExpr
        my sequence_25
        my si:reduce_symbol_end AndExpr
        return
    }
    
    method sequence_25 {} {
        # x
        #     (CmpExpr)
        #     (WS)
        #     *
        #         x
        #             (AndOp)
        #             (WS)
        #             (CmpExpr)
    
        my si:value_state_push
        my sym_CmpExpr
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my kleene_23
        my si:value_state_merge
        return
    }
    
    method kleene_23 {} {
        # *
        #     x
        #         (AndOp)
        #         (WS)
        #         (CmpExpr)
    
        while {1} {
            my si:void2_state_push
        my sequence_21
            my si:kleene_close
        }
        return
    }
    
    method sequence_21 {} {
        # x
        #     (AndOp)
        #     (WS)
        #     (CmpExpr)
    
        my si:value_state_push
        my sym_AndOp
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my sym_CmpExpr
        my si:value_state_merge
        return
    }
    
    #
    # value Symbol 'AndOp'
    #
    
    method sym_AndOp {} {
        # /
        #     "AND"
        #     "and"
    
        my si:void_symbol_start AndOp
        my choice_30
        my si:void_leaf_symbol_end AndOp
        return
    }
    
    method choice_30 {} {
        # /
        #     "AND"
        #     "and"
    
        my si:void_state_push
        my si:next_str AND
        my si:voidvoid_branch
        my si:next_str and
        my si:void_state_merge
        return
    }
    
    #
    # value Symbol 'Args'
    #
    
    method sym_Args {} {
        # x
        #     (Expr)
        #     *
        #         x
        #             ','
        #             (Expr)
    
        my si:value_symbol_start Args
        my sequence_40
        my si:reduce_symbol_end Args
        return
    }
    
    method sequence_40 {} {
        # x
        #     (Expr)
        #     *
        #         x
        #             ','
        #             (Expr)
    
        my si:value_state_push
        my sym_Expr
        my si:valuevalue_part
        my kleene_38
        my si:value_state_merge
        return
    }
    
    method kleene_38 {} {
        # *
        #     x
        #         ','
        #         (Expr)
    
        while {1} {
            my si:void2_state_push
        my sequence_36
            my si:kleene_close
        }
        return
    }
    
    method sequence_36 {} {
        # x
        #     ','
        #     (Expr)
    
        my si:void_state_push
        my si:next_char ,
        my si:voidvalue_part
        my sym_Expr
        my si:value_state_merge
        return
    }
    
    #
    # value Symbol 'Assign'
    #
    
    method sym_Assign {} {
        # /
        #     x
        #         (Table)
        #         (WS)
        #         "+="
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
    
        my si:value_symbol_start Assign
        my choice_61
        my si:reduce_symbol_end Assign
        return
    }
    
    method choice_61 {} {
        # /
        #     x
        #         (Table)
        #         (WS)
        #         "+="
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
    
        my si:value_state_push
        my sequence_52
        my si:valuevalue_branch
        my sequence_59
        my si:value_state_merge
        return
    }
    
    method sequence_52 {} {
        # x
        #     (Table)
        #     (WS)
        #     "+="
        #     (WS)
        #     (Cols)
        #     (WS)
        #     '?'
        #     (WS)
        #     (RelExpr)
    
        my si:value_state_push
        my sym_Table
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my si:next_str +=
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my sym_Cols
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my si:next_char ?
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my sym_RelExpr
        my si:value_state_merge
        return
    }
    
    method sequence_59 {} {
        # x
        #     (Table)
        #     (WS)
        #     (AssOp)
        #     (WS)
        #     (RelExpr)
    
        my si:value_state_push
        my sym_Table
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my sym_AssOp
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my sym_RelExpr
        my si:value_state_merge
        return
    }
    
    #
    # value Symbol 'AssOp'
    #
    
    method sym_AssOp {} {
        # /
        #     '='
        #     "+="
        #     "-="
        #     ":="
    
        my si:void_symbol_start AssOp
        my choice_68
        my si:void_leaf_symbol_end AssOp
        return
    }
    
    method choice_68 {} {
        # /
        #     '='
        #     "+="
        #     "-="
        #     ":="
    
        my si:void_state_push
        my si:next_char =
        my si:voidvoid_branch
        my si:next_str +=
        my si:voidvoid_branch
        my si:next_str -=
        my si:voidvoid_branch
        my si:next_str :=
        my si:void_state_merge
        return
    }
    
    #
    # value Symbol 'BitExpr'
    #
    
    method sym_BitExpr {} {
        # x
        #     (AddExpr)
        #     (WS)
        #     *
        #         x
        #             (BitOp)
        #             (WS)
        #             (AddExpr)
    
        my si:value_symbol_start BitExpr
        my sequence_80
        my si:reduce_symbol_end BitExpr
        return
    }
    
    method sequence_80 {} {
        # x
        #     (AddExpr)
        #     (WS)
        #     *
        #         x
        #             (BitOp)
        #             (WS)
        #             (AddExpr)
    
        my si:value_state_push
        my sym_AddExpr
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my kleene_78
        my si:value_state_merge
        return
    }
    
    method kleene_78 {} {
        # *
        #     x
        #         (BitOp)
        #         (WS)
        #         (AddExpr)
    
        while {1} {
            my si:void2_state_push
        my sequence_76
            my si:kleene_close
        }
        return
    }
    
    method sequence_76 {} {
        # x
        #     (BitOp)
        #     (WS)
        #     (AddExpr)
    
        my si:value_state_push
        my sym_BitOp
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my sym_AddExpr
        my si:value_state_merge
        return
    }
    
    #
    # value Symbol 'BitOp'
    #
    
    method sym_BitOp {} {
        # /
        #     "<<"
        #     ">>"
        #     [&|]
    
        my si:void_symbol_start BitOp
        my choice_86
        my si:void_leaf_symbol_end BitOp
        return
    }
    
    method choice_86 {} {
        # /
        #     "<<"
        #     ">>"
        #     [&|]
    
        my si:void_state_push
        my si:next_str <<
        my si:voidvoid_branch
        my si:next_str >>
        my si:voidvoid_branch
        my si:next_class &|
        my si:void_state_merge
        return
    }
    
    #
    # leaf Symbol 'CAll'
    #
    
    method sym_CAll {} {
        # '*'
    
        my si:void_symbol_start CAll
        my si:next_char *
        my si:void_leaf_symbol_end CAll
        return
    }
    
    #
    # leaf Symbol 'CDel'
    #
    
    method sym_CDel {} {
        # (Ident)
    
        my si:value_symbol_start CDel
        my sym_Ident
        my si:value_leaf_symbol_end CDel
        return
    }
    
    #
    # value Symbol 'CEqu'
    #
    
    method sym_CEqu {} {
        # x
        #     (Column)
        #     (WS)
        #     '='
        #     (WS)
        #     (Expr)
    
        my si:value_symbol_start CEqu
        my sequence_98
        my si:reduce_symbol_end CEqu
        return
    }
    
    method sequence_98 {} {
        # x
        #     (Column)
        #     (WS)
        #     '='
        #     (WS)
        #     (Expr)
    
        my si:value_state_push
        my sym_Column
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my si:next_char =
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my sym_Expr
        my si:value_state_merge
        return
    }
    
    #
    # value Symbol 'CFunc'
    #
    
    method sym_CFunc {} {
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
    
        my si:value_symbol_start CFunc
        my sequence_115
        my si:reduce_symbol_end CFunc
        return
    }
    
    method sequence_115 {} {
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
    
        my si:value_state_push
        my sym_Name
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my si:next_char \50
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my optional_106
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my si:next_char |
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my sym_OutArgs
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my si:next_char \51
        my si:valuevalue_part
        my sym_WS
        my si:value_state_merge
        return
    }
    
    method optional_106 {} {
        # ?
        #     (InArgs)
    
        my si:void2_state_push
        my sym_InArgs
        my si:void_state_merge_ok
        return
    }
    
    #
    # value Symbol 'CMap'
    #
    
    method sym_CMap {} {
        # x
        #     (Expr)
        #     (WS)
        #     (MapOp)
        #     (WS)
        #     (Column)
    
        my si:value_symbol_start CMap
        my sequence_123
        my si:reduce_symbol_end CMap
        return
    }
    
    method sequence_123 {} {
        # x
        #     (Expr)
        #     (WS)
        #     (MapOp)
        #     (WS)
        #     (Column)
    
        my si:value_state_push
        my sym_Expr
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my sym_MapOp
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my sym_Column
        my si:value_state_merge
        return
    }
    
    #
    # value Symbol 'CmpExpr'
    #
    
    method sym_CmpExpr {} {
        # x
        #     (BitExpr)
        #     (WS)
        #     *
        #         x
        #             (CmpOp)
        #             (WS)
        #             (BitExpr)
    
        my si:value_symbol_start CmpExpr
        my sequence_135
        my si:reduce_symbol_end CmpExpr
        return
    }
    
    method sequence_135 {} {
        # x
        #     (BitExpr)
        #     (WS)
        #     *
        #         x
        #             (CmpOp)
        #             (WS)
        #             (BitExpr)
    
        my si:value_state_push
        my sym_BitExpr
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my kleene_133
        my si:value_state_merge
        return
    }
    
    method kleene_133 {} {
        # *
        #     x
        #         (CmpOp)
        #         (WS)
        #         (BitExpr)
    
        while {1} {
            my si:void2_state_push
        my sequence_131
            my si:kleene_close
        }
        return
    }
    
    method sequence_131 {} {
        # x
        #     (CmpOp)
        #     (WS)
        #     (BitExpr)
    
        my si:value_state_push
        my sym_CmpOp
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my sym_BitExpr
        my si:value_state_merge
        return
    }
    
    #
    # value Symbol 'CmpOp'
    #
    
    method sym_CmpOp {} {
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
    
        my si:void_symbol_start CmpOp
        my choice_155
        my si:void_leaf_symbol_end CmpOp
        return
    }
    
    method choice_155 {} {
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
    
        my si:void_state_push
        my si:next_char <
        my si:voidvoid_branch
        my si:next_str <=
        my si:voidvoid_branch
        my si:next_char >
        my si:voidvoid_branch
        my si:next_str >==
        my si:voidvoid_branch
        my si:next_str ==
        my si:voidvoid_branch
        my si:next_str !=
        my si:voidvoid_branch
        my si:next_str <>IS
        my si:voidvoid_branch
        my si:next_str IS\40NOT
        my si:voidvoid_branch
        my si:next_str IN
        my si:voidvoid_branch
        my si:next_str LIKEis
        my si:voidvoid_branch
        my si:next_str is\40not
        my si:voidvoid_branch
        my si:next_str in
        my si:voidvoid_branch
        my si:next_str likeGLOB
        my si:voidvoid_branch
        my si:next_str MATCH
        my si:voidvoid_branch
        my si:next_str REGEXPglob
        my si:voidvoid_branch
        my si:next_str match
        my si:voidvoid_branch
        my si:next_str regexp
        my si:void_state_merge
        return
    }
    
    #
    # leaf Symbol 'CName'
    #
    
    method sym_CName {} {
        # (Ident)
    
        my si:value_symbol_start CName
        my sym_Ident
        my si:value_leaf_symbol_end CName
        return
    }
    
    #
    # value Symbol 'Col'
    #
    
    method sym_Col {} {
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
    
        my si:value_symbol_start Col
        my choice_170
        my si:reduce_symbol_end Col
        return
    }
    
    method choice_170 {} {
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
    
        my si:value_state_push
        my sym_CFunc
        my si:valuevalue_branch
        my sym_CMap
        my si:valuevalue_branch
        my sym_CEqu
        my si:valuevalue_branch
        my sequence_166
        my si:valuevalue_branch
        my sym_CName
        my si:valuevalue_branch
        my sym_CAll
        my si:value_state_merge
        return
    }
    
    method sequence_166 {} {
        # x
        #     '!'
        #     (WS)
        #     (CDel)
    
        my si:void_state_push
        my si:next_char !
        my si:voidvoid_part
        my sym_WS
        my si:voidvalue_part
        my sym_CDel
        my si:value_state_merge
        return
    }
    
    #
    # value Symbol 'Cols'
    #
    
    method sym_Cols {} {
        # x
        #     (Col)
        #     *
        #         x
        #             (WS)
        #             ?
        #                 ','
        #             (WS)
        #             (Col)
    
        my si:value_symbol_start Cols
        my sequence_184
        my si:reduce_symbol_end Cols
        return
    }
    
    method sequence_184 {} {
        # x
        #     (Col)
        #     *
        #         x
        #             (WS)
        #             ?
        #                 ','
        #             (WS)
        #             (Col)
    
        my si:value_state_push
        my sym_Col
        my si:valuevalue_part
        my kleene_182
        my si:value_state_merge
        return
    }
    
    method kleene_182 {} {
        # *
        #     x
        #         (WS)
        #         ?
        #             ','
        #         (WS)
        #         (Col)
    
        while {1} {
            my si:void2_state_push
        my sequence_180
            my si:kleene_close
        }
        return
    }
    
    method sequence_180 {} {
        # x
        #     (WS)
        #     ?
        #         ','
        #     (WS)
        #     (Col)
    
        my si:void_state_push
        my sym_WS
        my si:voidvoid_part
        my optional_176
        my si:voidvoid_part
        my sym_WS
        my si:voidvalue_part
        my sym_Col
        my si:value_state_merge
        return
    }
    
    method optional_176 {} {
        # ?
        #     ','
    
        my si:void2_state_push
        my si:next_char ,
        my si:void_state_merge_ok
        return
    }
    
    #
    # leaf Symbol 'Column'
    #
    
    method sym_Column {} {
        # (Ident)
    
        my si:value_symbol_start Column
        my sym_Ident
        my si:value_leaf_symbol_end Column
        return
    }
    
    #
    # value Symbol 'Comma'
    #
    
    method sym_Comma {} {
        # ','
    
        my si:void_symbol_start Comma
        my si:next_char ,
        my si:void_leaf_symbol_end Comma
        return
    }
    
    #
    # value Symbol 'EOF'
    #
    
    method sym_EOF {} {
        # !
        #     <dot>
    
        my si:void_symbol_start EOF
        my notahead_192
        my si:void_leaf_symbol_end EOF
        return
    }
    
    method notahead_192 {} {
        # !
        #     <dot>
    
        my i_loc_push
        my i_input_next dot
        my si:void_notahead_exit
        return
    }
    
    #
    # value Symbol 'Equ'
    #
    
    method sym_Equ {} {
        # '='
    
        my si:void_symbol_start Equ
        my si:next_char =
        my si:void_leaf_symbol_end Equ
        return
    }
    
    #
    # value Symbol 'Expr'
    #
    
    method sym_Expr {} {
        # (OrExpr)
    
        my si:value_symbol_start Expr
        my sym_OrExpr
        my si:reduce_symbol_end Expr
        return
    }
    
    #
    # value Symbol 'Frac'
    #
    
    method sym_Frac {} {
        # x
        #     '.'
        #     *
        #         <ddigit>
    
        my si:void_symbol_start Frac
        my sequence_203
        my si:void_leaf_symbol_end Frac
        return
    }
    
    method sequence_203 {} {
        # x
        #     '.'
        #     *
        #         <ddigit>
    
        my si:void_state_push
        my si:next_char .
        my si:voidvoid_part
        my kleene_201
        my si:void_state_merge
        return
    }
    
    method kleene_201 {} {
        # *
        #     <ddigit>
    
        while {1} {
            my si:void2_state_push
        my si:next_ddigit
            my si:kleene_close
        }
        return
    }
    
    #
    # leaf Symbol 'Func'
    #
    
    method sym_Func {} {
        # x
        #     (Name)
        #     (RP)
        #     ?
        #         (Args)
        #     (LP)
    
        my si:value_symbol_start Func
        my sequence_212
        my si:value_leaf_symbol_end Func
        return
    }
    
    method sequence_212 {} {
        # x
        #     (Name)
        #     (RP)
        #     ?
        #         (Args)
        #     (LP)
    
        my si:value_state_push
        my sym_Name
        my si:valuevalue_part
        my sym_RP
        my si:valuevalue_part
        my optional_209
        my si:valuevalue_part
        my sym_LP
        my si:value_state_merge
        return
    }
    
    method optional_209 {} {
        # ?
        #     (Args)
    
        my si:void2_state_push
        my sym_Args
        my si:void_state_merge_ok
        return
    }
    
    #
    # value Symbol 'Ident'
    #
    
    method sym_Ident {} {
        # x
        #     <alpha>
        #     *
        #         [_A Za z0 9]
    
        my si:void_symbol_start Ident
        my sequence_219
        my si:void_leaf_symbol_end Ident
        return
    }
    
    method sequence_219 {} {
        # x
        #     <alpha>
        #     *
        #         [_A Za z0 9]
    
        my si:void_state_push
        my si:next_alpha
        my si:voidvoid_part
        my kleene_217
        my si:void_state_merge
        return
    }
    
    method kleene_217 {} {
        # *
        #     [_A Za z0 9]
    
        while {1} {
            my si:void2_state_push
        my si:next_class _ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789
            my si:kleene_close
        }
        return
    }
    
    #
    # leaf Symbol 'InArgs'
    #
    
    method sym_InArgs {} {
        # ?
        #     x
        #         (Value)
        #         (WS)
        #         *
        #             x
        #                 ','
        #                 (WS)
        #                 (Value)
    
        my si:value_symbol_start InArgs
        my optional_233
        my si:value_leaf_symbol_end InArgs
        return
    }
    
    method optional_233 {} {
        # ?
        #     x
        #         (Value)
        #         (WS)
        #         *
        #             x
        #                 ','
        #                 (WS)
        #                 (Value)
    
        my si:void2_state_push
        my sequence_231
        my si:void_state_merge_ok
        return
    }
    
    method sequence_231 {} {
        # x
        #     (Value)
        #     (WS)
        #     *
        #         x
        #             ','
        #             (WS)
        #             (Value)
    
        my si:value_state_push
        my sym_Value
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my kleene_229
        my si:value_state_merge
        return
    }
    
    method kleene_229 {} {
        # *
        #     x
        #         ','
        #         (WS)
        #         (Value)
    
        while {1} {
            my si:void2_state_push
        my sequence_227
            my si:kleene_close
        }
        return
    }
    
    method sequence_227 {} {
        # x
        #     ','
        #     (WS)
        #     (Value)
    
        my si:void_state_push
        my si:next_char ,
        my si:voidvoid_part
        my sym_WS
        my si:voidvalue_part
        my sym_Value
        my si:value_state_merge
        return
    }
    
    #
    # value Symbol 'Int'
    #
    
    method sym_Int {} {
        # x
        #     ?
        #         (Sign)
        #     +
        #         <ddigit>
    
        my si:value_symbol_start Int
        my sequence_242
        my si:reduce_symbol_end Int
        return
    }
    
    method sequence_242 {} {
        # x
        #     ?
        #         (Sign)
        #     +
        #         <ddigit>
    
        my si:value_state_push
        my optional_237
        my si:valuevalue_part
        my poskleene_240
        my si:value_state_merge
        return
    }
    
    method optional_237 {} {
        # ?
        #     (Sign)
    
        my si:void2_state_push
        my sym_Sign
        my si:void_state_merge_ok
        return
    }
    
    method poskleene_240 {} {
        # +
        #     <ddigit>
    
        my i_loc_push
        my si:next_ddigit
        my si:kleene_abort
        while {1} {
            my si:void2_state_push
        my si:next_ddigit
            my si:kleene_close
        }
        return
    }
    
    #
    # value Symbol 'Join'
    #
    
    method sym_Join {} {
        # x
        #     (Select)
        #     (WS)
        #     *
        #         x
        #             (JoinOp)
        #             (WS)
        #             (Select)
    
        my si:value_symbol_start Join
        my sequence_254
        my si:reduce_symbol_end Join
        return
    }
    
    method sequence_254 {} {
        # x
        #     (Select)
        #     (WS)
        #     *
        #         x
        #             (JoinOp)
        #             (WS)
        #             (Select)
    
        my si:value_state_push
        my sym_Select
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my kleene_252
        my si:value_state_merge
        return
    }
    
    method kleene_252 {} {
        # *
        #     x
        #         (JoinOp)
        #         (WS)
        #         (Select)
    
        while {1} {
            my si:void2_state_push
        my sequence_250
            my si:kleene_close
        }
        return
    }
    
    method sequence_250 {} {
        # x
        #     (JoinOp)
        #     (WS)
        #     (Select)
    
        my si:value_state_push
        my sym_JoinOp
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my sym_Select
        my si:value_state_merge
        return
    }
    
    #
    # value Symbol 'JoinOp'
    #
    
    method sym_JoinOp {} {
        # [*/]
    
        my si:void_symbol_start JoinOp
        my si:next_class */
        my si:void_leaf_symbol_end JoinOp
        return
    }
    
    #
    # value Symbol 'LP'
    #
    
    method sym_LP {} {
        # '\)'
    
        my si:void_symbol_start LP
        my si:next_char \51
        my si:void_leaf_symbol_end LP
        return
    }
    
    #
    # void Symbol 'MapOp'
    #
    
    method sym_MapOp {} {
        # /
        #     "->"
        #     "as"
    
        my si:void_void_symbol_start MapOp
        my choice_263
        my si:void_clear_symbol_end MapOp
        return
    }
    
    method choice_263 {} {
        # /
        #     "->"
        #     "as"
    
        my si:void_state_push
        my si:next_str ->
        my si:voidvoid_branch
        my si:next_str as
        my si:void_state_merge
        return
    }
    
    #
    # value Symbol 'MulExpr'
    #
    
    method sym_MulExpr {} {
        # x
        #     (StrExpr)
        #     (WS)
        #     *
        #         x
        #             (MulOp)
        #             (WS)
        #             (StrExpr)
    
        my si:value_symbol_start MulExpr
        my sequence_275
        my si:reduce_symbol_end MulExpr
        return
    }
    
    method sequence_275 {} {
        # x
        #     (StrExpr)
        #     (WS)
        #     *
        #         x
        #             (MulOp)
        #             (WS)
        #             (StrExpr)
    
        my si:value_state_push
        my sym_StrExpr
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my kleene_273
        my si:value_state_merge
        return
    }
    
    method kleene_273 {} {
        # *
        #     x
        #         (MulOp)
        #         (WS)
        #         (StrExpr)
    
        while {1} {
            my si:void2_state_push
        my sequence_271
            my si:kleene_close
        }
        return
    }
    
    method sequence_271 {} {
        # x
        #     (MulOp)
        #     (WS)
        #     (StrExpr)
    
        my si:value_state_push
        my sym_MulOp
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my sym_StrExpr
        my si:value_state_merge
        return
    }
    
    #
    # value Symbol 'MulOp'
    #
    
    method sym_MulOp {} {
        # [*/%]
    
        my si:void_symbol_start MulOp
        my si:next_class */%
        my si:void_leaf_symbol_end MulOp
        return
    }
    
    #
    # leaf Symbol 'Name'
    #
    
    method sym_Name {} {
        # (Ident)
    
        my si:value_symbol_start Name
        my sym_Ident
        my si:value_leaf_symbol_end Name
        return
    }
    
    #
    # value Symbol 'NULL'
    #
    
    method sym_NULL {} {
        # "NULL"
    
        my si:void_symbol_start NULL
        my si:next_str NULL
        my si:void_leaf_symbol_end NULL
        return
    }
    
    #
    # value Symbol 'Number'
    #
    
    method sym_Number {} {
        # /
        #     (Real)
        #     (Int)
    
        my si:value_symbol_start Number
        my choice_286
        my si:reduce_symbol_end Number
        return
    }
    
    method choice_286 {} {
        # /
        #     (Real)
        #     (Int)
    
        my si:value_state_push
        my sym_Real
        my si:valuevalue_branch
        my sym_Int
        my si:value_state_merge
        return
    }
    
    #
    # value Symbol 'OrExpr'
    #
    
    method sym_OrExpr {} {
        # x
        #     (AndExpr)
        #     (WS)
        #     *
        #         x
        #             (OrOp)
        #             (WS)
        #             (AndExpr)
    
        my si:value_symbol_start OrExpr
        my sequence_298
        my si:reduce_symbol_end OrExpr
        return
    }
    
    method sequence_298 {} {
        # x
        #     (AndExpr)
        #     (WS)
        #     *
        #         x
        #             (OrOp)
        #             (WS)
        #             (AndExpr)
    
        my si:value_state_push
        my sym_AndExpr
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my kleene_296
        my si:value_state_merge
        return
    }
    
    method kleene_296 {} {
        # *
        #     x
        #         (OrOp)
        #         (WS)
        #         (AndExpr)
    
        while {1} {
            my si:void2_state_push
        my sequence_294
            my si:kleene_close
        }
        return
    }
    
    method sequence_294 {} {
        # x
        #     (OrOp)
        #     (WS)
        #     (AndExpr)
    
        my si:value_state_push
        my sym_OrOp
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my sym_AndExpr
        my si:value_state_merge
        return
    }
    
    #
    # value Symbol 'OrOp'
    #
    
    method sym_OrOp {} {
        # /
        #     "OR"
        #     "or"
    
        my si:void_symbol_start OrOp
        my choice_303
        my si:void_leaf_symbol_end OrOp
        return
    }
    
    method choice_303 {} {
        # /
        #     "OR"
        #     "or"
    
        my si:void_state_push
        my si:next_str OR
        my si:voidvoid_branch
        my si:next_str or
        my si:void_state_merge
        return
    }
    
    #
    # leaf Symbol 'OutArgs'
    #
    
    method sym_OutArgs {} {
        # x
        #     (Name)
        #     (WS)
        #     *
        #         x
        #             ','
        #             (WS)
        #             (Name)
    
        my si:value_symbol_start OutArgs
        my sequence_315
        my si:value_leaf_symbol_end OutArgs
        return
    }
    
    method sequence_315 {} {
        # x
        #     (Name)
        #     (WS)
        #     *
        #         x
        #             ','
        #             (WS)
        #             (Name)
    
        my si:value_state_push
        my sym_Name
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my kleene_313
        my si:value_state_merge
        return
    }
    
    method kleene_313 {} {
        # *
        #     x
        #         ','
        #         (WS)
        #         (Name)
    
        while {1} {
            my si:void2_state_push
        my sequence_311
            my si:kleene_close
        }
        return
    }
    
    method sequence_311 {} {
        # x
        #     ','
        #     (WS)
        #     (Name)
    
        my si:void_state_push
        my si:next_char ,
        my si:voidvoid_part
        my sym_WS
        my si:voidvalue_part
        my sym_Name
        my si:value_state_merge
        return
    }
    
    #
    # value Symbol 'Phrase'
    #
    
    method sym_Phrase {} {
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
    
        my si:value_symbol_start Phrase
        my choice_330
        my si:reduce_symbol_end Phrase
        return
    }
    
    method choice_330 {} {
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
    
        my si:value_state_push
        my sequence_322
        my si:valuevalue_branch
        my sequence_328
        my si:value_state_merge
        return
    }
    
    method sequence_322 {} {
        # x
        #     (WS)
        #     (Assign)
        #     (WS)
        #     (EOF)
    
        my si:void_state_push
        my sym_WS
        my si:voidvalue_part
        my sym_Assign
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my sym_EOF
        my si:value_state_merge
        return
    }
    
    method sequence_328 {} {
        # x
        #     (WS)
        #     (TopExpr)
        #     (WS)
        #     (EOF)
    
        my si:void_state_push
        my sym_WS
        my si:voidvalue_part
        my sym_TopExpr
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my sym_EOF
        my si:value_state_merge
        return
    }
    
    #
    # value Symbol 'Project'
    #
    
    method sym_Project {} {
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
    
        my si:value_symbol_start Project
        my choice_345
        my si:reduce_symbol_end Project
        return
    }
    
    method choice_345 {} {
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
    
        my si:value_state_push
        my sym_Tupple
        my si:valuevalue_branch
        my sequence_343
        my si:value_state_merge
        return
    }
    
    method sequence_343 {} {
        # x
        #     (RelValue)
        #     (WS)
        #     *
        #         x
        #             (ProjOp)
        #             (WS)
        #             (Cols)
    
        my si:value_state_push
        my sym_RelValue
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my kleene_341
        my si:value_state_merge
        return
    }
    
    method kleene_341 {} {
        # *
        #     x
        #         (ProjOp)
        #         (WS)
        #         (Cols)
    
        while {1} {
            my si:void2_state_push
        my sequence_339
            my si:kleene_close
        }
        return
    }
    
    method sequence_339 {} {
        # x
        #     (ProjOp)
        #     (WS)
        #     (Cols)
    
        my si:value_state_push
        my sym_ProjOp
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my sym_Cols
        my si:value_state_merge
        return
    }
    
    #
    # value Symbol 'ProjOp'
    #
    
    method sym_ProjOp {} {
        # '%'
    
        my si:void_symbol_start ProjOp
        my si:next_char %
        my si:void_leaf_symbol_end ProjOp
        return
    }
    
    #
    # value Symbol 'Real'
    #
    
    method sym_Real {} {
        # x
        #     ?
        #         (Sign)
        #     ?
        #         +
        #             <ddigit>
        #     (Frac)
    
        my si:value_symbol_start Real
        my sequence_357
        my si:reduce_symbol_end Real
        return
    }
    
    method sequence_357 {} {
        # x
        #     ?
        #         (Sign)
        #     ?
        #         +
        #             <ddigit>
        #     (Frac)
    
        my si:value_state_push
        my optional_237
        my si:valuevalue_part
        my optional_354
        my si:valuevalue_part
        my sym_Frac
        my si:value_state_merge
        return
    }
    
    method optional_354 {} {
        # ?
        #     +
        #         <ddigit>
    
        my si:void2_state_push
        my poskleene_240
        my si:void_state_merge_ok
        return
    }
    
    #
    # value Symbol 'RelExpr'
    #
    
    method sym_RelExpr {} {
        # (Sum)
    
        my si:value_symbol_start RelExpr
        my sym_Sum
        my si:reduce_symbol_end RelExpr
        return
    }
    
    #
    # value Symbol 'RelValue'
    #
    
    method sym_RelValue {} {
        # /
        #     x
        #         '\('
        #         (WS)
        #         (RelExpr)
        #         (WS)
        #         '\)'
        #     (Table)
    
        my si:value_symbol_start RelValue
        my choice_370
        my si:reduce_symbol_end RelValue
        return
    }
    
    method choice_370 {} {
        # /
        #     x
        #         '\('
        #         (WS)
        #         (RelExpr)
        #         (WS)
        #         '\)'
        #     (Table)
    
        my si:value_state_push
        my sequence_367
        my si:valuevalue_branch
        my sym_Table
        my si:value_state_merge
        return
    }
    
    method sequence_367 {} {
        # x
        #     '\('
        #     (WS)
        #     (RelExpr)
        #     (WS)
        #     '\)'
    
        my si:void_state_push
        my si:next_char \50
        my si:voidvoid_part
        my sym_WS
        my si:voidvalue_part
        my sym_RelExpr
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my si:next_char \51
        my si:value_state_merge
        return
    }
    
    #
    # value Symbol 'RP'
    #
    
    method sym_RP {} {
        # '\('
    
        my si:void_symbol_start RP
        my si:next_char \50
        my si:void_leaf_symbol_end RP
        return
    }
    
    #
    # value Symbol 'Select'
    #
    
    method sym_Select {} {
        # x
        #     (Project)
        #     (WS)
        #     *
        #         x
        #             (SelOp)
        #             (WS)
        #             (SelExpr)
    
        my si:value_symbol_start Select
        my sequence_384
        my si:reduce_symbol_end Select
        return
    }
    
    method sequence_384 {} {
        # x
        #     (Project)
        #     (WS)
        #     *
        #         x
        #             (SelOp)
        #             (WS)
        #             (SelExpr)
    
        my si:value_state_push
        my sym_Project
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my kleene_382
        my si:value_state_merge
        return
    }
    
    method kleene_382 {} {
        # *
        #     x
        #         (SelOp)
        #         (WS)
        #         (SelExpr)
    
        while {1} {
            my si:void2_state_push
        my sequence_380
            my si:kleene_close
        }
        return
    }
    
    method sequence_380 {} {
        # x
        #     (SelOp)
        #     (WS)
        #     (SelExpr)
    
        my si:value_state_push
        my sym_SelOp
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my sym_SelExpr
        my si:value_state_merge
        return
    }
    
    #
    # leaf Symbol 'SelExpr'
    #
    
    method sym_SelExpr {} {
        # (Expr)
    
        my si:value_symbol_start SelExpr
        my sym_Expr
        my si:value_leaf_symbol_end SelExpr
        return
    }
    
    #
    # value Symbol 'SelOp'
    #
    
    method sym_SelOp {} {
        # ':'
    
        my si:void_symbol_start SelOp
        my si:next_char :
        my si:void_leaf_symbol_end SelOp
        return
    }
    
    #
    # value Symbol 'Sign'
    #
    
    method sym_Sign {} {
        # [+-]
    
        my si:void_symbol_start Sign
        my si:next_class +-
        my si:void_leaf_symbol_end Sign
        return
    }
    
    #
    # value Symbol 'StrExpr'
    #
    
    method sym_StrExpr {} {
        # x
        #     (Value)
        #     (WS)
        #     *
        #         x
        #             (StrOp)
        #             (WS)
        #             (Value)
    
        my si:value_symbol_start StrExpr
        my sequence_402
        my si:reduce_symbol_end StrExpr
        return
    }
    
    method sequence_402 {} {
        # x
        #     (Value)
        #     (WS)
        #     *
        #         x
        #             (StrOp)
        #             (WS)
        #             (Value)
    
        my si:value_state_push
        my sym_Value
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my kleene_400
        my si:value_state_merge
        return
    }
    
    method kleene_400 {} {
        # *
        #     x
        #         (StrOp)
        #         (WS)
        #         (Value)
    
        while {1} {
            my si:void2_state_push
        my sequence_398
            my si:kleene_close
        }
        return
    }
    
    method sequence_398 {} {
        # x
        #     (StrOp)
        #     (WS)
        #     (Value)
    
        my si:value_state_push
        my sym_StrOp
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my sym_Value
        my si:value_state_merge
        return
    }
    
    #
    # leaf Symbol 'String'
    #
    
    method sym_String {} {
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
    
        my si:void_symbol_start String
        my choice_426
        my si:void_leaf_symbol_end String
        return
    }
    
    method choice_426 {} {
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
    
        my si:void_state_push
        my sequence_415
        my si:voidvoid_branch
        my sequence_424
        my si:void_state_merge
        return
    }
    
    method sequence_415 {} {
        # x
        #     '\"'
        #     *
        #         x
        #             !
        #                 '\"'
        #             <dot>
        #     '\"'
    
        my si:void_state_push
        my si:next_char \42
        my si:voidvoid_part
        my kleene_412
        my si:voidvoid_part
        my si:next_char \42
        my si:void_state_merge
        return
    }
    
    method kleene_412 {} {
        # *
        #     x
        #         !
        #             '\"'
        #         <dot>
    
        while {1} {
            my si:void2_state_push
        my sequence_410
            my si:kleene_close
        }
        return
    }
    
    method sequence_410 {} {
        # x
        #     !
        #         '\"'
        #     <dot>
    
        my si:void_state_push
        my notahead_407
        my si:voidvoid_part
        my i_input_next dot
        my si:void_state_merge
        return
    }
    
    method notahead_407 {} {
        # !
        #     '\"'
    
        my i_loc_push
        my si:next_char \42
        my si:void_notahead_exit
        return
    }
    
    method sequence_424 {} {
        # x
        #     '''
        #     *
        #         x
        #             !
        #                 '\"'
        #             <dot>
        #     '''
    
        my si:void_state_push
        my si:next_char '
        my si:voidvoid_part
        my kleene_412
        my si:voidvoid_part
        my si:next_char '
        my si:void_state_merge
        return
    }
    
    #
    # value Symbol 'StrOp'
    #
    
    method sym_StrOp {} {
        # "||"
    
        my si:void_symbol_start StrOp
        my si:next_str ||
        my si:void_leaf_symbol_end StrOp
        return
    }
    
    #
    # value Symbol 'Sum'
    #
    
    method sym_Sum {} {
        # x
        #     (Join)
        #     (WS)
        #     *
        #         x
        #             (SumOp)
        #             (WS)
        #             (Join)
    
        my si:value_symbol_start Sum
        my sequence_440
        my si:reduce_symbol_end Sum
        return
    }
    
    method sequence_440 {} {
        # x
        #     (Join)
        #     (WS)
        #     *
        #         x
        #             (SumOp)
        #             (WS)
        #             (Join)
    
        my si:value_state_push
        my sym_Join
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my kleene_438
        my si:value_state_merge
        return
    }
    
    method kleene_438 {} {
        # *
        #     x
        #         (SumOp)
        #         (WS)
        #         (Join)
    
        while {1} {
            my si:void2_state_push
        my sequence_436
            my si:kleene_close
        }
        return
    }
    
    method sequence_436 {} {
        # x
        #     (SumOp)
        #     (WS)
        #     (Join)
    
        my si:value_state_push
        my sym_SumOp
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my sym_Join
        my si:value_state_merge
        return
    }
    
    #
    # value Symbol 'SumOp'
    #
    
    method sym_SumOp {} {
        # [+-.]
    
        my si:void_symbol_start SumOp
        my si:next_class +-.
        my si:void_leaf_symbol_end SumOp
        return
    }
    
    #
    # leaf Symbol 'Table'
    #
    
    method sym_Table {} {
        # (Ident)
    
        my si:value_symbol_start Table
        my sym_Ident
        my si:value_leaf_symbol_end Table
        return
    }
    
    #
    # value Symbol 'TopExpr'
    #
    
    method sym_TopExpr {} {
        # (RelExpr)
    
        my si:value_symbol_start TopExpr
        my sym_RelExpr
        my si:reduce_symbol_end TopExpr
        return
    }
    
    #
    # value Symbol 'Tupple'
    #
    
    method sym_Tupple {} {
        # x
        #     (ProjOp)
        #     (WS)
        #     (Cols)
    
        my si:value_symbol_start Tupple
        my sequence_339
        my si:reduce_symbol_end Tupple
        return
    }
    
    #
    # value Symbol 'Value'
    #
    
    method sym_Value {} {
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
    
        my si:value_symbol_start Value
        my choice_467
        my si:reduce_symbol_end Value
        return
    }
    
    method choice_467 {} {
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
    
        my si:value_state_push
        my sequence_459
        my si:valuevalue_branch
        my sym_Func
        my si:valuevalue_branch
        my sym_NULL
        my si:valuevalue_branch
        my sym_Real
        my si:valuevalue_branch
        my sym_Int
        my si:valuevalue_branch
        my sym_String
        my si:valuevalue_branch
        my sym_VName
        my si:value_state_merge
        return
    }
    
    method sequence_459 {} {
        # x
        #     (RP)
        #     (WS)
        #     (Expr)
        #     (WS)
        #     (LP)
    
        my si:value_state_push
        my sym_RP
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my sym_Expr
        my si:valuevalue_part
        my sym_WS
        my si:valuevalue_part
        my sym_LP
        my si:value_state_merge
        return
    }
    
    #
    # leaf Symbol 'VName'
    #
    
    method sym_VName {} {
        # (Ident)
    
        my si:value_symbol_start VName
        my sym_Ident
        my si:value_leaf_symbol_end VName
        return
    }
    
    #
    # void Symbol 'WS'
    #
    
    method sym_WS {} {
        # *
        #     <space>
    
        my si:void_void_symbol_start WS
        my kleene_473
        my si:void_clear_symbol_end WS
        return
    }
    
    method kleene_473 {} {
        # *
        #     <space>
    
        while {1} {
            my si:void2_state_push
        my si:next_space
            my si:kleene_close
        }
        return
    }
    
    ## END of GENERATED CODE. DO NOT EDIT.
    # # ## ### ###### ######## #############
}

# # ## ### ##### ######## ############# #####################
## Ready

package provide isbl-parser 1



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

