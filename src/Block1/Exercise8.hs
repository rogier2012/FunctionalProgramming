module Exercise8 where


allEqual :: Eq a=> [a] -> Bool
allEqual [x] = True
allEqual [] = True
allEqual (x:y:xs)
    | x == y                    = allEqual (y:xs)
    | otherwise                 = False


isAS :: (Eq a,Num a)=> [a] -> Bool
isAS [] = True
isAS [x] = True
isAS [x,y] = True
isAS (x:y:z:xs)
    | (x-y) == (y-z)    = isAS (y:z:xs)
    | otherwise         = False


