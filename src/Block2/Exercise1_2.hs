module Exercise1_2 where
import FPPrac.Trees
import Exercise1_1

treeAdd :: Tree1a -> Int -> Tree1a
treeAdd (Leaf1a n) x = Leaf1a (n + x)
treeAdd (Node1a n t1 t2) x = Node1a (n+x) (treeAdd t1 x) (treeAdd t2 x)

treeSquare :: Tree1a -> Tree1a
treeSquare (Leaf1a n) = Leaf1a (n^2)
treeSquare (Node1a n t1 t2) = Node1a (n^2) (treeSquare t1) (treeSquare t2)

mapTree :: (Int -> Int ) -> Tree1a -> Tree1a
mapTree f (Leaf1a n) = Leaf1a (f n)
mapTree f (Node1a n t1 t2) = Node1a (f n) (mapTree f t1) (mapTree f t2)

addNode :: Tree1b -> Tree1a
addNode (Leaf1b (a,b)) = Leaf1a (a+b)
addNode (Node1b (a,b) t1 t2) = Node1a (a+b) (addNode t1) (addNode t2)

mapTreeVar :: ((Int,Int) -> Int) -> Tree1b -> Tree1a
mapTreeVar f (Leaf1b n) = Leaf1a (f n)
mapTreeVar f (Node1b n t1 t2) = Node1a (f n) (mapTreeVar f t1) (mapTreeVar f t2)
