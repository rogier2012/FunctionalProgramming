module Exercise2_3 where

--multiple x y = y `mod` x == 0 && y!=x

notdivisable :: Integer -> Integer -> Bool
notdivisable y x = x `mod` y /= 0

divisable x y = x `mod` y== 0

sieve :: [Integer] -> [Integer]
sieve [] = []
sieve (x:xs) = x : filter (notdivisable x) (sieve xs)

isprimenumber :: Integer -> Bool
isprimenumber x = elem x (sieve [2..(x+1)])

nprimes :: Int -> [Integer]
nprimes n = take n (sieve [2..])

primessmaller :: Integer -> [Integer]
primessmaller n = filter (<n) (sieve [2..n])

dividers :: Integer -> [Integer]
dividers n = filter (divisable n) [2..n]

isprime :: Integer -> Bool
isprime n = length (dividers n) == 1

