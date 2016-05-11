module Exercise2_6 where

sublistH :: Ord a=> [a] -> [a] -> Bool
sublistH [] _ = True
sublistH xs [] = False
sublistH (x:xs) (y:ys)
    | x == y            = sublistH xs ys
    | otherwise         = False

sublist :: Ord a=> [a] -> [a] -> Bool
sublist xs ys = sublistH xs (dropWhile (/=head xs) ys)

partialsublist :: Ord a=> [a] -> [a] -> Bool
partialsublist [] _ = True
partialsublist xs [] = False
partialsublist (x:xs) (y:ys)
    | x == y            = partialsublist xs ys
    | otherwise         = partialsublist (x:xs) ys