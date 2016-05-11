module Exercise4 where

discr :: (Num a,Ord a)=> a -> a -> a -> a
discr a b c
    | b*b - 4*a*c >= 0  = b*b - 4*a*c
    | otherwise         = error "negative discriminant"

root1 a b c = (-b - sqrt(discr a b c))/(2*a)

root2 a b c = (-b + sqrt(discr a b c))/(2*a)