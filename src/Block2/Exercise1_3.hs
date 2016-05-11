module Exercise1_3 where
import Exercise1_1
import FPPrac.Trees


binMirror :: Tree1a -> Tree1a
binMirror (Leaf1a n) = Leaf1a n
binMirror (Node1a n t1 t2) = Node1a n (binMirror t2) (binMirror t1)

binMirrorD :: Tree1d -> Tree1d
binMirrorD (Leaf1d (a,b)) = Leaf1d (b,a)
binMirrorD (Node1d t1s) = Node1d (map binMirrorD t1s)