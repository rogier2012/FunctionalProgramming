module Exercise5 where

extrX :: Float  -> Float -> Float
extrX a b = -b / (2*a)

extrY :: Float -> Float -> Float -> Float
extrY a b c = a*(extrX a b)^2 + b*(extrX a b) + c