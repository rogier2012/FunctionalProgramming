module Exercise2_1 where

myfilter :: (a -> Bool) -> [a] -> [a]
myfilter p [] = []
myfilter p (x:xs)
    | p x       =  x : myfilter p xs
    | otherwise = myfilter p xs

myfoldr :: (a -> b -> b) -> b -> [a] -> b
myfoldr f z []     = z
myfoldr f z (x:xs) = f x (foldr f z xs)


myfoldl :: (a -> b -> a) -> a -> [b] -> a
myfoldl f z []     =  z
myfoldl f z (x:xs) =  foldl f (f z x) xs

myzipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myzipWith f xs [] = []
myzipWith f [] ys = []
myzipWith f (x:xs) (y:ys) = [f x y] ++ myzipWith f xs ys