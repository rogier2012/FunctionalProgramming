module Exercise2_7 where
import Data.List
bubble :: Ord a=> [a] -> [a]
bubble [x] = [x]
bubble (x:y:xs)
    | x <= y        = x : bubble (y:xs)
    | otherwise     = y : bubble (x:xs)



bsort :: Ord a=> [a] -> [a]
bsort xs
    | xs == []      = xs
    | otherwise     = bsort  ( init (bubble xs)) ++ [last ( bubble xs)]


mmsort :: Ord a=> [a] -> [a]
mmsort [] = []
mmsort [x] = [x]
mmsort xs = [minimum xs] ++ (mmsort(xs\\[minimum xs, maximum xs])) ++ [maximum xs]

ins :: Ord a=> [a] -> a -> [a]
ins [] n  = [n]
ins (x:xs) n
    | n <= x        = n : x : xs
    | otherwise     = x : ins xs n


isort :: Ord a=> [a] -> [a]
isort xs = foldl ins [] xs


merge :: Ord a=> [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys)
    | x <= y        = x : merge xs (y:ys)
    | otherwise     = y : merge (x:xs) ys

msort :: Ord a=> [a] -> [a]
msort [x] = [x]
msort xs = merge (msort (take a xs)) (msort (drop a xs))
        where
            a = (length xs) `div` 2


qsort [] = []
qsort (x:xs) =  qsort (filter (<= x)xs) ++ [x] ++  qsort (filter (> x) xs)