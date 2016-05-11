module Exercise2_5 where
import Data.List


increasing :: Ord a=> [a] -> Bool
increasing [x] = True
increasing (x:y:ys)
        | x < y     = increasing (y:ys)
        | otherwise = False

average :: Fractional a => [a] -> a
average xs = sum xs / genericLength xs

weaklyIncreasing1 :: (Fractional a, Ord a)=> [a] -> Bool
weaklyIncreasing1 [] = True
weaklyIncreasing1 [x] = True
weaklyIncreasing1 (x:xs)
        | x > average xs    = weaklyIncreasing1 xs
        | otherwise         = False

weaklyIncreasing :: (Fractional a,Ord a)=> [a] -> Bool
weaklyIncreasing xs = weaklyIncreasing1 (reverse xs)