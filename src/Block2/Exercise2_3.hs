module Exercise2_3 where

--final states R S U
data States = Q | R | S | T | U | E
    deriving Show

isLetter x = elem x "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
isDigit x = elem x "0123456789"
isPositiveDigit x = elem x "123456789"
isOperator x = elem x "+-*^/<>="
isBracket x = elem x "()"
isWhite x = elem x " "

--fsa s x =  case s of
--            Q | x == 'a' -> Q
--              | x == 'b' -> R
--            R | x == 'a' -> R
--              | x == 'b' -> Q
--
--
--recognize xs = foldl fsa Q xs
--fsa (Q, token) (x:xs )  = fsa (Q, token ++ [x] )xs
--fsa (Q, token) (y:ys)  = (token, y:ys)

num :: [String] -> (States,String) -> String -> ([String],States, String)
num ys (s,token) (x:xs) = case s of
            Q | x == '0' -> num ys (S,token ++ [x]) xs
              | isPositiveDigit x -> num ys (R, token ++ [x]) xs
              | otherwise ->  num ys (E, token) xs
            S | x == '.' ->  num ys (T,token ++ [x]) xs
              | otherwise -> tokenize (x:xs) (ys++[token])
            T | isDigit x -> num ys (U, token ++ [x]) xs
              | otherwise -> num ys (E, token) xs
            R | isDigit x -> num ys (R, token ++ [x]) xs
              | x == '.' -> num ys (T,token ++ [x]) xs
              | otherwise -> tokenize (x:xs) (ys++[token])
            U | isDigit x -> num ys (U, token ++ [x]) xs
              | otherwise -> tokenize (x:xs) (ys++[token])
            E -> num ys (E,token) xs


--number :: [Char] -> (States, String)
--number xs = foldl num (Q,"") xs

iden :: [String] -> (States,String) -> String -> ([String],States, String)
iden ys (s,token) (x:xs) = case s of
            Q | isLetter x -> iden ys (R, token ++ [x]) xs
              | otherwise -> iden ys (E, token) xs
            R | isLetter x || isDigit x -> iden ys (R, token ++ [x]) xs
              | otherwise -> tokenize (x:xs) (ys++[token])

--identifier :: [Char] -> (States, String)
--identifier xs = foldl iden (Q,"") xs

oper :: [String] -> (States,String) -> String -> ([String],States, String)
oper ys (s,token) (x:xs) = case s of
    Q | elem x "-*%=/" -> oper ys (R, token ++ [x]) xs
      | elem x "<>" -> oper ys (T, token ++ [x]) xs
      | x ==  '+' -> oper ys (U, token ++ [x]) xs
      | otherwise -> oper ys (E, token)  xs
    T | x == '=' -> oper ys (R, token ++ [x]) xs
      | otherwise -> tokenize (x:xs) (ys++[token])
    U | x == '+' -> oper ys (R, token ++ [x])  xs
      | otherwise -> tokenize (x:xs) (ys++[token])
    R -> tokenize (x:xs) (ys++[token])
    E -> oper ys (E, token) xs

--operator :: [Char] -> (States, String)
--operator xs = foldl oper (Q,"") xs


brac :: [String] -> (States,String) -> String -> ([String],States, String)
brac ys (s,token) (x:xs) = case s of
            Q | x == '(' || x== ')' -> brac ys (R, token ++ [x]) xs
              | otherwise -> brac ys (E, token) xs
            R -> tokenize (x:xs) (ys++[token])
            E -> brac ys (E,token) xs

--brackets :: [Char] -> (States, String)
--brackets xs = foldl brac (Q,"") xs


whit :: [String] -> (States,String) -> String -> ([String],States, String)
whit ys (s,token) (x:xs) = case s of
            Q | x == ' ' -> whit ys (R, token ++ [x]) xs
              | otherwise -> whit ys (E,token) xs
            R | x == ' ' -> whit ys (R, token ++ [x]) xs
              | otherwise -> tokenize (x:xs) (ys++[token])
            E -> whit ys (E,token) xs

--whitespace :: [Char] -> (States, String)
--whitespace xs = foldl whit (Q,"") xs

tokenize :: String -> [String] -> ([String],States,String)
tokenize xs ys | isBracket (head xs) = brac ys (Q, "") xs
               | isDigit (head xs) = num ys (Q, "") xs
               | isLetter (head xs) = iden ys (Q, "") xs
               | isOperator (head xs) = oper ys (Q, "") xs
               | isWhite (head xs) = whit ys (Q, "") xs
               | xs == "#" = (ys, Q, xs )
               | otherwise = error "Parse error "

fst3 :: ([String],a,b) -> [String]
fst3 (x,_,_) = x

tokenizer :: String -> [String]
tokenizer xs = fst3 (tokenize (xs++"#") [])