module Exercise2_4 where


pyth :: Integer -> [(Integer, Integer, Integer)]
pyth n = [(a,b,c) | a <- [1..n], b <- [1..n], c <- [1..n], a^2 + b^2 == c^2]

primitive (a,b,c) (d,e,f)
        | (c == f && a == e) || (d `mod` a == 0 && f`mod`c == 0)    = False
        | otherwise                                                 = True

funct1 [] = []
funct1 (x:xs) = x : filter (primitive x) (funct1 xs)


pyth1 n = funct1 (pyth n)