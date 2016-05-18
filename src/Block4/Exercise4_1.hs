module Block4.Exercise4_1 where
import FP_TypesEtc
import FP_ParserGen (parse)
import GHC.Generics       -- Necessary for correct function of FPPrac
import Tokenizer
import FPPrac.Trees

grammar nt = case nt of

        Nmbr    -> [[ nmbr                               ]]

        Op      -> [[ op                                 ]]

        Var     -> [[ var                                ]]

        Expr    -> [[ lBracket, Expr, Op, Expr, rBracket ]
                   ,[ Nmbr                               ]
                   ,[ Var                                ]]

        Stmnt   -> [[ Var,is, Expr                        ]
                    , [rept, Expr, Stmnt                ]]




lBracket  = Symbol "("          -- Symbols will NOT be shown in the parse tree.
rBracket  = Symbol ")"
is        = Terminal "="
rept      = Terminal "repeat"


nmbr      = SyntCat Nmbr
op        = SyntCat Op
var       = SyntCat Var


example = "((3+3)*4)"
assign = "repeat (3+3) hoi=3"

exampleprint = prpr $ parse grammar Expr (tokenizer example)
exampleass = prpr $ parse grammar Stmnt (tokenizer assign)