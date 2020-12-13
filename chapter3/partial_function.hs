type Optional a = (a, Bool)

(>=>) :: (a -> Optional b) -> (b -> Optional c) -> (a -> Optional c)
m1 >=> m2 = \x -> 
    let (y, b1) = m1 x
        (z, b2) = m2 y
    in (z, b1&&b2)

return :: a -> Optional a
return x = (x, True)

safe_reciprocal :: Float -> Optional Float
safe_reciprocal x | (x /= 0) = (1/x, True)
                  | otherwise = (x, False)

safe_root :: Float -> Optional Float
safe_root x | x >= 0 = (sqrt x, True)
            | otherwise = (x, False)

-- f = safe_root >=> safe_reciprocal
-- f 0 == (0.0, False)
-- f (-2) == (-0.5, False)
-- f 16 == (0.25, True)
