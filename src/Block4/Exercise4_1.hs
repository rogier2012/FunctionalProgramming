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


        If      -> [[ iff, lBracket, Expr, Cond, Expr, rBracket]]

        Then    -> [[ thenn, Expr]]

        Else    -> [[ elsee, Expr]]

        Cond    -> [[ eq ]
                    ,[ gt ]
                    ,[ gte ]
                    ,[ lt ]
                    ,[ lte ]]

        Expr    -> [[ lBracket, Expr, Op, Expr, rBracket ]
                   ,[ Nmbr                               ]
                   ,[ Var                                ]
                   ,[ If,Then,Else]]

        Stmnt   -> [[ Var,is, Expr                        ]
                    , [rept, Expr, Stmnt                ]]




lBracket    = Symbol "("          -- Symbols will NOT be shown in the parse tree.
rBracket    = Symbol ")"

rept        = Terminal "repeat"
iff         = Terminal "if"
thenn       = Terminal "then"
elsee       = Terminal "else"

eq          = Terminal "=="
gt          = Terminal ">"
gte         = Terminal ">="
lt          = Terminal "<"
lte         = Terminal "<="

is          = Terminal "="



nmbr        = SyntCat Nmbr
op          = SyntCat Op
var         = SyntCat Var

type Variable = String

data AST = Ex ASTExpr
         | St ASTStmnt

data ASTExpr = Const Int
             | Variable String
             | BinExpr String ASTExpr ASTExpr



data ASTStmnt = Assign String ASTExpr
              | Repeat ASTExpr ASTStmnt


--toAst :: ParseTree -> AST

--toAst (PLeaf (tkn,str, i))
-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
-- = = = = = = = = = = = = = = = = =   ===               =             = = = =   ====  ===   = = = = = = = = = = = =
-- = = = = = = = = = = = = = = = = =   =  =                            = = = =   =     =  =  = = = = = = = = = = = =
-- = = = = = = = = = = = = = = = = =   ===    ==    ==   =   ==   = =  = = = =   = =   ===   = = = = = = = = = = = =
-- = = = = = = = = = = = = = = = = =   = =   =  =  =  =  =  = ==  =    = = = =   =     =     = = = = = = = = = = = =
-- = = = = = = = = = = = = = = = = =   =  =   ==    ===  =   ===  =    = = = =   =     =     = = = = = = = = = = = =
-- = = = = = = = = = = = = = = = = =                  =                = = = =               = = = = = = = = = = = =
-- = = = = = = = = = = = = = = = = =                ==                 = = = =               = = = = = = = = = = = =
-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

transform :: ParseTree -> AST
transform (PNode Stmnt xs)                          = St (transformStmnt(PNode Stmnt xs))
transform (PNode Expr xs)                           = Ex (transformExpr(PNode Expr xs))

transformStmnt :: ParseTree -> ASTStmnt
transformStmnt (PNode Stmnt [(PLeaf x),n2,n3])      = Repeat (transformExpr n2) (transformStmnt n3)
transformStmnt (PNode Stmnt [n1,(PLeaf x),n3])      = Assign (variable n1) (transformExpr n3)

transformExpr :: ParseTree -> ASTExpr
transformExpr (PNode Expr [n1, n2, n3])             = BinExpr (operation n2) (transformExpr n1) (transformExpr n3)
transformExpr (PNode Expr [n1])                     = transformExpr n1
transformExpr (PNode Nmbr [(PLeaf (a,b,c))])        = Const (read b)
transformExpr (PNode Var [(PLeaf (a,b,c))])         = Variable b

variable  (PNode Var [(PLeaf (a,b,c))])             = b
operation (PNode Op [(PLeaf (a,b,c))])              = b

example = "((a+3)*(3-4))"
assign = "repeat (3+3) repeat (3+3) x=1"

ifexample = "if (3 == D) then 3 else 4"

instance ToRoseTree ASTExpr where
    toRoseTree t = case t of
            BinExpr s t1 t2     -> RoseNode s [(toRoseTree t1),(toRoseTree t2)]

            Const x             -> RoseNode (show x) []

            Variable x          -> RoseNode x []


instance ToRoseTree ASTStmnt where
    toRoseTree t = case t of

            Assign s t          -> RoseNode s [(toRoseTree t)]

            Repeat t1 t2        -> RoseNode "Repeat" [(toRoseTree t1),(toRoseTree t2)]


instance ToRoseTree AST where
    toRoseTree t = case t of

            St t                -> toRoseTree t

            Ex t                -> toRoseTree t




exampleprint = prpr $ parse grammar Expr (tokenizer example)
exampleass = showTree $ toRoseTree $ parse grammar Stmnt (tokenizer assign)
hallo = showTree $ toRoseTree $ transform $ parse grammar Expr (tokenizer example)
hallot = showTree $ toRoseTree $ transform $ parse grammar Stmnt (tokenizer assign)


