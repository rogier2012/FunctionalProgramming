module FP_Core where

{-
Extension of CoreIntro.hs:
- instructions as program *in* the processor,
- stack now is list of fixed length,i
- clock added
- program counter + stack pointer added,
- instruction EndProg added,
- update operaton (<~) added,
-}

-- ========================================================================

type Stack  = [Int]

type Heap = [Int]

type Variable = String

lut :: [(String,Int)]
lut = [("var",123)]

lookupelem e (x:xs)
        | e == fst x = snd x
        | otherwise  = lookupelem e xs

data Op     = Add | Mul | Sub
            deriving Show

data Instr  = PushConst Int
            | PushAddr Int
            | Store Int
            | Calc Op
            | EndProg
            deriving Show

data Tick = Tick

data Expr = Const Int                   -- for constants
          | Variable String             -- for variables
          | BinExpr Op Expr Expr        -- for ``binary expressions''


data Stmnt = Assign Variable Expr

-- ========================================================================
-- Processor functions

xs <~ (i,a) = take i xs ++ [a] ++ drop (i+1) xs
                -- Put value a on position i in list xs

alu op = case op of
                Add -> (+)
                Mul -> (*)
                Sub -> (-)


core :: [Instr] -> (Int,Int,Heap,Stack) -> Tick -> (Int,Int,Heap,Stack)

core instrs (pc,sp,heap,stack) tick =  case instrs!!pc of

        PushConst n -> ((pc+1, sp+1 , heap, stack <~ (sp,n)))

        PushAddr n   -> (pc+1, sp+1 , heap, stack <~ (sp,(heap!!n)))

        Store n -> (pc+1, sp-1, heap<~(n, stack!!sp), stack )

        Calc op  -> (pc+1, sp-1 ,heap, stack <~ (sp-2,v))
                 where
                   v = alu op (stack!!(sp-2)) (stack!!(sp-1))

        EndProg  -> (-1, sp,heap, stack)

-- ========================================================================
-- example Program for expression: (((2*10) + (3*(4+11))) * (12+5))

-- Tree of this expression of type Expr (result of parsing):
expr = BinExpr Mul
          (BinExpr Add
              (BinExpr Mul
                  (Const 2)
                  (Const 10))
              (BinExpr Mul
                  (Const 3)
                  (BinExpr Add
                      (Const 4)
                      (Const 11))))
          (BinExpr Add
              (Const 12)
              (Const 5))

-- The program that results in the value of the expression (1105):
prog = [ PushConst 2
       , PushConst 10
       , Calc Mul
       , PushConst 3
       , PushConst 4
       , PushConst 11
       , Calc Add
       , Calc Mul
       , Calc Add
       , PushConst 12
       , PushConst 5
       , Calc Add
       , Calc Mul
       , EndProg
       ]

-- Testing
clock      = repeat Tick
emptyStack = replicate 8 0
emptyHeap  = replicate 8 0
test       = putStr
           $ unlines
           $ map show
           $ takeWhile (\(pc,_,_,_) -> pc /= -1)

           $ scanl (core prog) (0,0,emptyHeap,emptyStack) clock


