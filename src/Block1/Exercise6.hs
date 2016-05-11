module Exercise6 where

mylength ::  [b] -> Int
mylength [] = 0
mylength (x:xs) = 1 + mylength xs

mysum :: Num a=> [a] -> a
mysum [] = 0
mysum (x:xs) = x + mysum xs

myreverse :: [a] -> [a]
myreverse [] = []
myreverse (x:xs) = myreverse xs ++ [x]

mytake :: [a] -> Int -> [a]
mytake xs 0 = []
mytake [] n = []
mytake (x:xs) n = [x] ++ mytake xs (n-1)


myelem :: Eq a =>[a] -> a -> Bool
myelem [] n = False
myelem (x:xs) n
    | x == n        = True
    | otherwise     = myelem xs n


myconcat :: [[a]] -> [a]
myconcat [] = []
myconcat (x:xs) = x ++ myconcat xs

mymaximum :: Ord a=> [a] -> a
mymaximum [x] = x
mymaximum (x:xs)
    | x > a                 = x
    | otherwise             = a
        where
            a = mymaximum xs


myzip :: [a] -> [b] -> [(a,b)]
myzip [] [] = []
myzip xs [] = []
myzip [] ys = []
myzip (x:xs) (y:ys) = [(x,y)] ++ myzip xs ys