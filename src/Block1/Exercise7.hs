module Exercise7 where
import Exercise6
r :: Num a => a -> a -> [a]
r a d = [a] ++ r (a+d) d


r1 :: Num a=> a -> a -> Int -> a
r1 a d n = (r a d)!!n

total :: (Num a)=> [a] -> Int -> Int -> a
total xs i j
    | i == j        = xs!!i
    | otherwise     = (total xs (i+1) j) + xs!!i

totalnew :: (Num a)=> [a] -> Int -> Int -> a
totalnew (x:xs) 0 j = mysum (mytake (x:xs) (j+1))
totalnew (x:xs) i j = totalnew xs (i-1) (j-1)