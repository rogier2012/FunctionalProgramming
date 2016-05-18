module Tokenizer where
import FP_TypesEtc
--final states R S U
data States = Q | R | S | T | U | E
    deriving Show

isLetter x = elem x "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
isDigit x = elem x "0123456789"
isPositiveDigit x = elem x "123456789"
isOperator x = elem x "+-*^/<>="
isBracket x = elem x "()"
isWhite x = elem x " "

reserved = ["repeat", "if", "else", "then"]


num :: [(Alphabet,String,Int)] -> (States,String) -> String -> Int -> ([(Alphabet,String,Int)],States, String)
num ys (s,token) (x:xs) cntr = case s of
            Q | x == '0'                -> num ys (S,token ++ [x]) xs cntr
              | isPositiveDigit x       -> num ys (R, token ++ [x]) xs cntr
              | otherwise               -> num ys (E, token) xs cntr
            S | x == '.'                -> num ys (T,token ++ [x]) xs cntr
              | otherwise               -> tokenize (x:xs) (ys++[(Nmbr,token,cntr + 1)]) (cntr + 1)
            T | isDigit x               -> num ys (U, token ++ [x]) xs cntr
              | otherwise               -> num ys (E, token) xs cntr
            R | isDigit x               -> num ys (R, token ++ [x]) xs cntr
              | x == '.'                -> num ys (T,token ++ [x]) xs cntr
              | otherwise               -> tokenize (x:xs) (ys++[(Nmbr,token,cntr + 1)]) (cntr + 1)
            U | isDigit x               -> num ys (U, token ++ [x]) xs cntr
              | otherwise               -> tokenize (x:xs) (ys++[(Nmbr,token,cntr + 1)]) (cntr + 1)
            E                           -> num ys (E,token) xs cntr

iden :: [(Alphabet,String,Int)] -> (States,String) -> String -> Int -> ([(Alphabet,String,Int)],States, String)
iden ys (s,token) (x:xs) cntr = case s of
            Q | isLetter x              -> iden ys (R, token ++ [x]) xs cntr
              | otherwise               -> iden ys (E, token) xs cntr
            R | isLetter x || isDigit x -> iden ys (R, token ++ [x]) xs cntr
              | otherwise               -> tokenize (x:xs) (ys++[(Var,token,cntr + 1)]) (cntr+1)

oper :: [(Alphabet,String,Int)] -> (States,String) -> String -> Int -> ([(Alphabet,String,Int)],States, String)
oper ys (s,token) (x:xs) cntr = case s of
            Q | elem x "-*%=/"          -> oper ys (R, token ++ [x]) xs cntr
              | elem x "<>"             -> oper ys (T, token ++ [x]) xs cntr
              | x ==  '+'               -> oper ys (U, token ++ [x]) xs cntr
              | otherwise               -> oper ys (E, token)  xs cntr
            T | x == '='                -> oper ys (R, token ++ [x]) xs cntr
              | otherwise               -> tokenize (x:xs) (ys++[(Op,token,cntr + 1)]) (cntr + 1)
            U | x == '+'                -> oper ys (R, token ++ [x])  xs cntr
              | otherwise               -> tokenize (x:xs) (ys++[(Op,token,cntr + 1)]) (cntr + 1)
            R                           -> tokenize (x:xs) (ys++[(Op,token,cntr + 1)]) (cntr + 1)
            E                           -> oper ys (E, token) xs cntr

brac :: [(Alphabet,String,Int)] -> (States,String) -> String -> Int -> ([(Alphabet,String,Int)],States, String)
brac ys (s,token) (x:xs) cntr = case s of
            Q | x == '(' || x== ')'     -> brac ys (R, token ++ [x]) xs cntr
              | otherwise               -> brac ys (E, token) xs cntr
            R                           -> tokenize (x:xs) (ys++[(Bracket,token,cntr)]) (cntr)
            E                           -> brac ys (E,token) xs cntr


whit :: [(Alphabet,String,Int)] -> (States,String) -> String -> Int -> ([(Alphabet,String,Int)],States, String)
whit ys (s,token) (x:xs) cntr = case s of
            Q | x == ' '                -> whit ys (R, token ++ [x]) xs cntr
              | otherwise               -> whit ys (E,token) xs cntr
            R | x == ' '                -> whit ys (R, token ++ [x]) xs cntr
              | otherwise               -> tokenize (x:xs) (ys) cntr
            E                           -> whit ys (E,token) xs cntr

tokenize :: String -> [(Alphabet,String,Int)] -> Int -> ([(Alphabet,String,Int)],States,String)
tokenize xs ys cntr
              | isBracket (head xs)     = brac ys (Q, "") xs cntr
              | isDigit (head xs)       = num ys (Q, "") xs cntr
              | isLetter (head xs)      = iden ys (Q, "") xs cntr
              | isOperator (head xs)    = oper ys (Q, "") xs cntr
              | isWhite (head xs)       = whit ys (Q, "") xs cntr
              | xs == "#"               = (ys, Q, xs )
              | otherwise               = error "Parse error"

fst3 :: ([(Alphabet,String,Int)],a,b) -> [(Alphabet,String,Int)]
fst3 (x,_,_) = x

checkreserved :: [(Alphabet,String,Int)] -> [(Alphabet,String,Int)]
checkreserved []                        = []
checkreserved ((a,x,b):xs)
               | elem x reserved == False = (a,x,b) : checkreserved xs
               | otherwise              = (Reserved,x,b) : checkreserved xs

tokenizer :: String -> [(Alphabet,String,Int)]
tokenizer xs =  checkreserved $ fst3 (tokenize (xs++"#") [] 0)
