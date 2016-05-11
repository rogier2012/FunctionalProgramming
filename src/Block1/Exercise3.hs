module Exercise3 where


amount :: Float -> Float -> Int -> Float


amount a r 0 = a
amount a r n = (1 + r/100) * amount a r (n-1)