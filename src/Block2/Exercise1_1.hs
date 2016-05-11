module Exercise1_1 where
import FPPrac.Trees

data Tree1a = Leaf1a Int
            | Node1a Int Tree1a Tree1a

pp1a :: Tree1a -> RoseTree
pp1a (Leaf1a n) = RoseNode (show n)  []
pp1a (Node1a n t1 t2) = RoseNode (show n)  [pp1a(t1),pp1a(t2)]

data Tree1b = Leaf1b (Int,Int)
            | Node1b (Int,Int) Tree1b Tree1b


pp1b :: Tree1b -> RoseTree
pp1b (Leaf1b n) = RoseNode (show n) []
pp1b (Node1b n t1 t2) = RoseNode (show n) [pp1b(t1), pp1b(t2)]


data Tree1c = Leaf1c Int
            | Node1c Tree1c Tree1c

pp1c :: Tree1c -> RoseTree
pp1c (Leaf1c n) = RoseNode (show n) []
pp1c (Node1c t1 t2) = RoseNode "" [pp1c(t1),pp1c(t2)]


data Tree1d = Leaf1d (Int,Int)
            | Node1d  [Tree1d]

pp1d :: Tree1d -> RoseTree
pp1d (Leaf1d n )= RoseNode (show n )[]
pp1d (Node1d t1s) = RoseNode ""  (map pp1d t1s)

