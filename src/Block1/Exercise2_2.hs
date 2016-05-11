module Exercise2_2 where
import Data.Char
import Data.List

-- Type :: (String, Int, String,String)
--type database = [(String, Int, String, String)]
database = [("John Doe", 20, "Man", "Enschede"),("Jane Doe", 19, "Female", "Enschede"),("Jon Doe", 23, "Man", "Hengelo"),("Janet Doe", 32, "Female", "Hengelo")]

getName :: (String, Integer, String,String) -> String
getName (x,_,_,_) = x

getAge :: (String, Integer, String,String) -> Integer
getAge (_,x,_,_) = x

getSexe :: (String, Integer, String,String) -> String
getSexe (_,_,x,_) = x

getResidence :: (String, Integer, String,String) -> String
getResidence  (_,_,_,x) = x


increaseAgeRec :: Integer -> [(String, Integer, String,String)] -> [(String, Integer, String,String)]
increaseAgeRec n [] = []
increaseAgeRec n ((a,x,b,c):xs) = (a,x+n,b,c) : increaseAgeRec n xs

increaseAgeLC :: Integer -> [(String, Integer, String,String)] -> [(String, Integer, String,String)]
increaseAgeLC n xs = [(a,x+n,b,c) | (a,x,b,c) <- xs]

increaseAge :: Integer -> (String, Integer, String,String) -> (String, Integer, String,String)
increaseAge n (a,b,c,d) = (a,b+n,c,d)

increaseAgeHO :: Integer -> [(String, Integer, String,String)] -> [(String, Integer, String,String)]
increaseAgeHO n xs = map (increaseAge n) xs


womenRec :: [(String, Integer, String,String)] -> [String]
womenRec [] = []
womenRec ((a,b,c,d):xs)
    | c == "Female" && b > 29 && b < 41     = [a] ++ womenRec xs
    | otherwise                             = womenRec xs

womenLC :: [(String, Integer, String,String)] -> [String]
womenLC xs = [ a | (a,b,c,d) <- xs, c == "Female", b > 29 , b < 41 ]


isMilf :: (String, Integer, String,String) -> Bool
isMilf (a,b,c,d)
    | c == "Female" && b > 29 && b < 41 = True
    | otherwise                         = False


womenHO :: [(String, Integer, String,String)] -> [String]
womenHO xs = map getName (filter isMilf xs)


getAgeofName :: String -> [(String, Integer, String,String)] -> Integer
getAgeofName name [] = error "Person not found"
getAgeofName name ((a,b,c,d):xs)
    | map toLower name == map toLower a     = b
    | otherwise                             = getAgeofName name xs

changeNameAge :: [(a, b, String,String)] -> [(b, a, String,String)]
changeNameAge xs = [(b,a,c,d) | (a,b,c,d) <- xs ]

sortByAge :: [(String, Integer, String,String)] -> [(String, Integer, String,String)]
sortByAge xs = changeNameAge(sort (changeNameAge xs))


