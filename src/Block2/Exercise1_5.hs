module Exercise1_5 where
import FPPrac.Trees
import Exercise1_4

subtreeAt n (Leaf4 ) = error "Subtree does not exist"
subtreeAt n (Node4 m t1 t2)
        | n == m        = Node4 m t1 t2
        | n < m         = subtreeAt n t1
        | n > m         = subtreeAt n t2
