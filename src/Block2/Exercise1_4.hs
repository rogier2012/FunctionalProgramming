module Exercise1_4 where
import FPPrac.Trees

data Tree4  = Leaf4
            | Node4 Int Tree4 Tree4

pp4 (Leaf4) = RoseNode "" []
pp4 (Node4 n t1 t2) = RoseNode (show n) [pp4(t1),pp4(t2)]

insertTree :: Int -> Tree4 -> Tree4
insertTree n (Leaf4) = Node4 n Leaf4 Leaf4
insertTree n (Node4 m t1 t2)
        | n <= m    = Node4 m (insertTree n (t1)) t2
        | otherwise = Node4 m t1 (insertTree n (t2))

makeTreeRec :: [Int] -> Tree4
makeTreeRec [x] = Node4 x Leaf4 Leaf4
makeTreeRec (x:xs) = insertTree x (makeTreeRec xs)

makeTreeFoldr :: [Int] -> Tree4
makeTreeFoldr xs = foldr insertTree Leaf4 xs

makeList :: Tree4 -> [Int]
makeList (Leaf4) = []
makeList (Node4 n t1 t2) = makeList(t1) ++ [n] ++ makeList(t2)

sortList xs = makeList ( makeTreeFoldr xs)


--sortTree tree = makeTreeFoldr ( makeList (tree))
sortTree  = makeTreeFoldr . makeList