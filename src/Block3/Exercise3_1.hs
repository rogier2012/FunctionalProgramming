module Exercise3_1 where
import FPPrac.Trees
import FP_Core

codeGenerator :: Expr -> [Instr]
codeGenerator (Const x) = [PushConst x]
codeGenerator (Variable x) = [PushAddr (lookupelem x lut)]
codeGenerator (BinExpr op t1 t2) = (codeGenerator t1) ++ (codeGenerator t2) ++ [(Calc op)]

codeGen :: Expr -> [Instr]
codeGen expr = codeGenerator expr ++ [EndProg]

ppExpr :: Expr -> RoseTree
ppExpr (Const x) = RoseNode (show x) []
ppExpr (BinExpr op t1 t2) = RoseNode (show op) [ppExpr(t1),ppExpr(t2)]


codeGen' :: Stmnt -> [Instr ]
codeGen' (Assign var expr) = codeGen expr ++ [Store (lookupelem var lut)]
