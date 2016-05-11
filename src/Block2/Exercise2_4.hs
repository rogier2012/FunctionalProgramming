module Exercise2_4 where
import Exercise2_3
import Exercise2_1
import Exercise2_2



parse1 :: (Num a,Read a)=> Cat -> [String] -> ((BinTree String (Either a String)), [String])
parse1 Expr (x:xs) | x == "("                       = (t,ys)
                   | (head x) == ' '                = parse1 Expr xs
                   | Exercise2_2.isDigit (head x)   = (BinLeaf (Left (read x)),xs)
                   | otherwise                      = (BinLeaf (Right x),xs)
                        where
                           (t0,r0) = parse1 Expr xs
                           rsub = trimwhite r0
                           op = head rsub
                           (t1,r1) = parse1 Expr (tail rsub)
                           ys = tail r1
                           t = BinNode op t0 t1

trimwhite :: [String] -> [String]
trimwhite (x:xs) | (head x ) == ' ' = xs
                 | otherwise        = (x:xs)