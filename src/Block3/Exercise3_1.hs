module Exercise3_1 where
import FPPrac.Trees
import FP_Core




class CodeGen a where
    codeGen :: a -> [Instr]

instance CodeGen Expr where
    codeGen (Const x) = [PushConst x]
    codeGen (Variable x) = [PushAddr (lookupelem x lut)]
    codeGen (BinExpr op t1 t2) = (codeGen t1) ++ (codeGen t2) ++ [(Calc op)]

instance CodeGen Stmnt where
    codeGen (Assign var expr) = codeGen expr ++ [Store (lookupelem var lut)]
    codeGen (Repeat expr xs) = codeGen expr ++ [PushPC] ++ concat(map codeGen xs) ++ [EndRep]


class PPInstr a where
    ppInstr :: a -> RoseTree

instance PPInstr(Expr) where
    ppInstr (Const x) = RoseNode (show x) []
    ppInstr (BinExpr op t1 t2) = RoseNode (show op) [ppInstr(t1),ppInstr(t2)]

instance PPInstr(Stmnt) where
    ppInstr (Assign var expr) = RoseNode var [ppInstr(expr)]

