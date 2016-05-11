module Main where
import FPPrac.Trees
import Exercise1_1
import Exercise1_2
import Exercise1_3
import Exercise1_4
import Exercise1_5
import Exercise1_6
import Exercise1_7
import Exercise1_8
import Exercise2_1
import Exercise2_2
import Exercise2_3
import Exercise2_4
import Exercise2_5
-- Exercise 1-1----------
--main = do showRoseTree (pp1a (Node1a 7 (Node1a 9 (Leaf1a 3) (Leaf1a 5)) (Node1a 8 (Node1a 12 (Leaf1a 15) (Leaf1a 20)) (Leaf1a 30))))
--main = do showRoseTree (pp1b (Node1b (7,1) (Node1b (9,1) (Leaf1b (3,1)) (Leaf1b (5,1))) (Node1b (8,1) (Node1b (12,1) (Leaf1b (15,1)) (Leaf1b (20,1))) (Leaf1b (30,1)))))
--main = do showRoseTree (pp1d (Node1d [(Leaf1d (1,2)), (Leaf1d (1,3)), (Leaf1d (1,4)), (Leaf1d (1,4))]))

--Exercise 1-2-----------
--main = do showRoseTree (pp1a(treeAdd (Node1a 7 (Node1a 9 (Leaf1a 3) (Leaf1a 5)) (Node1a 8 (Node1a 12 (Leaf1a 15) (Leaf1a 20)) (Leaf1a 30))) 30))
--main = do showRoseTree (pp1a(treeSquare (Node1a 7 (Node1a 9 (Leaf1a 3) (Leaf1a 5)) (Node1a 8 (Node1a 12 (Leaf1a 15) (Leaf1a 20)) (Leaf1a 30)))))
--main = do showRoseTree (pp1a(mapTree (+10) (Node1a 7 (Node1a 9 (Leaf1a 3) (Leaf1a 5)) (Node1a 8 (Node1a 12 (Leaf1a 15) (Leaf1a 20)) (Leaf1a 30)))))
--main = do showRoseTree (pp1a (addNode (Node1b (7,1) (Node1b (9,1) (Leaf1b (3,1)) (Leaf1b (5,1))) (Node1b (8,1) (Node1b (12,1) (Leaf1b (15,1)) (Leaf1b (20,1))) (Leaf1b (30,1))))))

--main = do showRoseTree (pp1a (mapTreeVar (\(x,y) -> x*y) (Node1b (7,2) (Node1b (9,1) (Leaf1b (3,1)) (Leaf1b (5,1))) (Node1b (8,1) (Node1b (12,1) (Leaf1b (15,1)) (Leaf1b (20,1))) (Leaf1b (30,2))))))


--Exercise 1-3-----------
--main = do showRoseTree (pp1a(binMirror (Node1a 7 (Node1a 9 (Leaf1a 3) (Leaf1a 5)) (Node1a 8 (Node1a 12 (Leaf1a 15) (Leaf1a 20)) (Leaf1a 30)))))
--main = do showRoseTree (pp1a(binMirror (binMirror(Node1a 7 (Node1a 9 (Leaf1a 3) (Leaf1a 5)) (Node1a 8 (Node1a 12 (Leaf1a 15) (Leaf1a 20)) (Leaf1a 30))))))
--main = do showRoseTree (pp1d (binMirrorD(Node1d [(Leaf1d (1,2)), (Leaf1d (1,3)), (Leaf1d (1,4)), (Leaf1d (1,4))])))

--Exercise 1-4-------------
--main = do showRoseTree ( pp4 (  insertTree 9 ( Node4 7 (Node4 8 Leaf4  Leaf4 ) (Node4 9 (Node4 8 Leaf4 Leaf4 ) Leaf4 ))))
--main = do showRoseTree ( pp4 ( makeTreeRec [3,5,6,5,67,34,2,2,2,5,8,4]  ))
--main = do showRoseTree ( pp4 ( makeTreeFoldr [3,5,6,5,67,34,2,2,2,5,8,4]  ))
--main = do print (  makeList  ( Node4 7 (Node4 8 Leaf4  Leaf4 ) (Node4 9 (Node4 8 Leaf4 Leaf4 ) Leaf4 )))
--main = do print (sortList [5,23,2,5,7,8,8,4,23,2])
--main = do showRoseTree ( pp4 (  sortTree  ( Node4 7 (Node4 8 Leaf4  Leaf4 ) (Node4 7 (Node4 8 Leaf4 Leaf4 ) Leaf4 ))))

--Exercise 1-5-------------
--main = do showRoseTree ( pp4 (  subtreeAt  10 ( Node4 7 (Node4 8 Leaf4  Leaf4 ) (Node4 9 (Node4 8 Leaf4 Leaf4 ) Leaf4 ))))

--Exercise 1-6--------------
--main = do showRoseTree ( pp4 (  cutOffAt  4 ( makeTreeFoldr [3,5,6,5,67,34,2,2,2,5,8,4])))

--Exercise 1-7-------------
--main = do showRoseTree ( pp1a (  replace  4 "rl" ((Node1a 7 (Node1a 9 (Leaf1a 3) (Leaf1a 5)) (Node1a 8 (Node1a 12 (Leaf1a 15) (Leaf1a 20)) (Leaf1a 30)) ))))
--main = do showRoseTree ( pp1a (  subTree  "rl" ((Node1a 7 (Node1a 9 (Leaf1a 3) (Leaf1a 5)) (Node1a 8 (Node1a 12 (Leaf1a 15) (Leaf1a 20)) (Leaf1a 30)) ))))

--Exercise 1-8-------------
--main = do showRoseTree ( pp4  ( makeTreeFoldr [3,5,6,5,67,34,2,2,2,5,5,8,4]))
--main = do print ( isBalanced  ( makeTreeFoldr [3,5,6,5,67,34,2,2,2,5,8,4]))
--main = do print ( isBalanced  ( makeTreeFoldr [1..10]))
--main = do showRoseTree ( pp4  ( balance(makeTreeFoldr [1..100])))
--main = do print ( isBalanced  (  balance(makeTreeFoldr [1..10])))

--Exercise 2-1-------------
--main = do showRoseTree (ppBin (( Node4 7 (Node4 8 Leaf4  Leaf4 ) (Node4 9 (Node4 8 Leaf4 Leaf4 ) Leaf4 ))))

--Exercise 2-2-------------
--main = do showRoseTree( ppBin ( fst(parse Expr "(((8-6)+(4+a))-((8-6)+(4+5)))")))

--Exercise 2-3-------------
--main = do print (tokenizer "gijs++ron<=rogier(407+2049)++chris")
--          print (number "5253")
--          print (whitespace "   ")
--          print (operator "--")
--          print (brackets "(")

--Exercise 2-4-------------
--main = do showRoseTree( ppBin ( fst(parse1 Expr (tokenizer(" ( (gijs++ron) <=((rogier+(407+2049))++chris))")))))


--Exercise 2-5 -------------
main = do print (eval (fst (parse1 Expr (tokenizer("(((12/3)*(6+a12345))+hihi)")))))