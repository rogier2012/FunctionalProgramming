module Exercise1_7 where
import FPPrac.Trees
import Exercise1_1

replace :: Int -> String -> Tree1a -> Tree1a
replace n [] (Leaf1a m)          = Leaf1a n
replace n [] (Node1a m t1 t2)    = Node1a n t1 t2
replace n ps (Leaf1a m)          = error "Path does not exists"
replace n (p:ps) (Node1a m t1 t2)
        | p == 'l'          = Node1a m (replace n ps t1) t2
        | p == 'r'          = Node1a m t1 (replace n ps t2)


subTree [] tree = tree
subTree ps (Leaf1a m) = error "Path too long"
subTree (p:ps) (Node1a m t1 t2)
        | p == 'l'          = subTree ps t1
        | p == 'r'          = subTree ps t2


