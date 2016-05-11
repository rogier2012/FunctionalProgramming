module Exercise2_1 where
import FPPrac.Trees

data BinTree a b = BinNode a (BinTree a b)  (BinTree a b)
                 | BinLeaf b

data Unit = Unit
type Tree1a = BinTree Int Int
type Tree1b = BinTree (Int,Int) (Int, Int)
type Tree1c = BinTree Unit Int
type Tree4 = BinTree Int Unit


ppBin :: (Show a, Show b) => BinTree a b -> RoseTree
ppBin (BinLeaf n) = RoseNode (show n) []
ppBin (BinNode n t1 t2) = RoseNode (show n) [ppBin(t1),ppBin(t2)]