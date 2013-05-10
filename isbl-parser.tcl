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

