module Exercise2_2 where
import Exercise2_1
import Data.Either

isDigit x = elem x "0123456789"
isOperator x = elem x "+-*/^"

data Cat = Expr | Op


parse :: Cat -> String -> ((BinTree Char (Either Int Char)), String)
parse Expr ('(':xs) = (t,ys)
            where
                (t0,r0) = parse Expr xs
                op = head r0
                (t1,r1) = parse Expr (tail r0)
                ys = tail r1
                t = BinNode op t0 t1


parse Expr (x:xs) | isDigit x = (BinLeaf (Left (read [x])),xs)
                  | otherwise = (BinLeaf (Right x),xs)


