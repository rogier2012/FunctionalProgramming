module Block4.Exercise4_1 where
import FP_TypesEtc
import FP_ParserGen (parse)
import GHC.Generics       -- Necessary for correct function of FPPrac
import Tokenizer

grammar nt = case nt of

        Nmbr    -> [[ nmbr                               ]]

        Op      -> [[ op                                 ]]

        Var     -> [[ var                                ]]

        Expr    -> [[ lBracket, Expr, Op, Expr, rBracket ]
                   ,[ Nmbr                               ]
                   , [Var                                ]]

        Stmnt   -> [[ Assign, Var, Expr                  ]
                    ,  [(+:) [Stmnt                      ]]]




lBracket  = Symbol "("          -- Symbols will NOT be shown in the parse tree.
rBracket  = Symbol ")"

nmbr      = SyntCat Nmbr
op        = SyntCat Op
var       = SyntCat Var


example = "(3+3)"