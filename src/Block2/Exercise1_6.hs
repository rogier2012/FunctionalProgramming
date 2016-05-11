module Exercise1_6 where
import FPPrac.Trees
import Exercise1_4

cutOffAt :: Int -> Tree4 -> Tree4
cutOffAt n (Leaf4) = Leaf4
cutOffAt 0 (Node4 m t1 t2) = Node4 m Leaf4 Leaf4
cutOffAt n (Node4 m t1 t2) = Node4 m (cutOffAt (n-1) t1) (cutOffAt (n-1) t2)
