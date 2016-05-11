module Exercise2 where
import Data.Char



code :: Int -> Char -> Char
code m n
    | n >= 'A' && n <= 'Z'   = chr(a)
    | n >= 'a' && n <= 'z'   = chr(b)
    | otherwise              = n
        where a = ((((ord n) - 65) + m) `mod` 26) + 65
              b = ((((ord n) - 97) + m) `mod` 26) + 97
