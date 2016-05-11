module Exercise2_5 where
import Exercise2_1
import Exercise2_4
import Exercise2_2

table :: (Num a,Read a) =>[(String, a)]
table = [("a12345",15),("hihi",1414)]

operators :: (Num a, Fractional a)=>[(String, (a->a->a))]
operators = [("+",(+)),("*",(*)),("/",(/))]

lookupelem e (x:xs)
        | e == fst x = snd x
        | otherwise  = lookupelem e xs



eval :: (Num a,Read a,Fractional a) => BinTree String (Either a String) -> a
eval (BinLeaf (Left b))         = b
eval (BinLeaf (Right b))        = lookupelem b table
eval (BinNode a t1 t2) = (lookupelem a operators) (eval t1) (eval t2)