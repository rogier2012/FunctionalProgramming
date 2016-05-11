module Exercise9 where
import Exercise6
import Exercise8

allRowsEqualLength :: [[a]] -> Bool
allRowsEqualLength [x,y] = length x == length y
allRowsEqualLength (x:y:xs)
    | length x == length y      = allRowsEqualLength (y:xs)
    | otherwise                 = False

rowsEqual xs = allEqual (map length xs)


rowTotals :: Num a => [[a]] -> [a]
rowTotals xs  = map mysum xs

transpose :: Num a => [[a]] -> [[a]]
transpose ([]:xs) = []
transpose xs = (map head xs) : transpose (map tail xs)

columnTotals xs  = rowTotals (transpose xs)