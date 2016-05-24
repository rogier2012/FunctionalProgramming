module Block4.Exercise4_2 where
import Data.Maybe

data Expr   = Const Int
            | Var String
            | BinOp String Expr Expr
            | App Expr Expr
--            | If Expr String Expr Then Expr Else Expr

data Type   = IntType
            | BoolType
            | FunType Type Type
            deriving (Show,Eq)

type Env = [(String, Type)]

environment = [("+", FunType IntType (FunType IntType IntType)), ("-",  FunType IntType (FunType IntType IntType)),
 ("*", FunType IntType (FunType IntType IntType)), ("x", IntType) ]

typeOf :: Env -> Expr -> Type
typeOf env (Const a) = IntType
typeOf env (Var a)
        | t == Nothing                  = error "..."
        | otherwise                     = fromJust t
            where
                t = lookup a env
typeOf env (BinOp op e e') = case top of
        Nothing                         -> error "..."

        Just (FunType t0 (FunType t1 t2))
            | t0 == te && t1 == te'     -> t2
            | otherwise                 -> error "..."

        Just _                          -> error "..."
    where
       top  = lookup op env
       te   = typeOf env e
       te'  = typeOf env e'

typeOf env (App f x) = typeOf env f
--        | tf == (FunType tx t1)         = t1
--        | otherwise                     = error ""
--            where
--                tf = typeOf env f
--                tx = typeOf env x


