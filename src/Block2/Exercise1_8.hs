module Exercise1_8 where
import FPPrac.Trees
import Exercise1_4
import Data.List

depth :: Tree4 -> Int
depth (Leaf4) = 0
depth (Node4 m t1 t2) = 1 + maximum[depth t1, depth t2]

isBalanced :: Tree4 -> Bool
isBalanced Leaf4 = True
isBalanced (Node4 m t1 t2)
            | (a <= 1&& a >= -1)  = isBalanced t1 && isBalanced t2
            | otherwise           = False
            where
                a = (depth t1) - (depth t2)

balancehelper :: [Int] -> Tree4
balancehelper [] = Leaf4
balancehelper xs = Node4 a (balancehelper((filter (<=a) xs)\\[a])) (balancehelper(filter (>a) xs))
        where
            a = xs!!(b)
            b = length xs `div` 2

balance :: Tree4 -> Tree4
balance tree = balancehelper ( makeList (tree))