module Block4.Exercise4_2 where

data Expr   = Const Int
            | Var String
            | BinOp String Expr Expr
            | App Expr Expr

data Type   = IntType
            | FunType Type Type
            deriving Show

type Env = [(String, Type)]

environment = [("+", FunType IntType (FunType IntType IntType)), ("-",  FunType IntType (FunType IntType IntType)),
 ("*", FunType IntType (FunType IntType IntType)), ("x", IntType) ]

typeOf :: Env -> Expr -> Type
typeOf env (Const a) = IntType
typeOf env (Var a)
        | t == Nothing                  = error ”...”
        | otherwise                     = fromJust t
         where
         t = lookup x env
typeOf env (BinOp op e e') = case top of
        Nothing                         -> error ""

        Just (FunType t0 (FunType t1 t2))
            | t0 == te && t1 == te'     -> t2
            | otherwise                 -> error ""

        Just _                          -> error ""
       where
           top  = lookup op env
           te   = typeOf env e
           te'  = typeOf env e'




