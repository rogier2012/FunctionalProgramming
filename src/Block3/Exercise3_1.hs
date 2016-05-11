module Exercise3_1 where
import FPPrac.Trees
import FP_Core

codeGenerator :: Expr -> [Instr]
codeGenerator (Const x) = [PushConst x]
codeGenerator (Variable x) = [PushAddr (lookupelem x lut)]
codeGenerator (BinExpr op t1 t2) = (codeGenerator t1) ++ (codeGenerator t2) ++ [(Calc op)]


class CodeGen a where
    codeGen :: a -> [Instr]

instance CodeGen Expr where
    codeGen expr = codeGenerator expr ++ [EndProg]

instance CodeGen Stmnt where
    codeGen (Assign var expr) = codeGenerator expr ++ [Store (lookupelem var lut)]

instance CodeGen Repeat where
    codeGen (expr xs) = codeGenerator expr ++ [PushPC] ++ (map codeGen xs) ++ [EndRep]

class PPInstr a where
    ppInstr :: a -> RoseTree

instance PPInstr(Expr) where
    ppInstr (Const x) = RoseNode (show x) []
    ppInstr (BinExpr op t1 t2) = RoseNode (show op) [ppInstr(t1),ppInstr(t2)]

instance PPInstr(Stmnt) where
    ppInstr (Assign var expr) = RoseNode var [ppInstr(expr)]

