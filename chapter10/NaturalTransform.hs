Maybe to List
alpha :: Maybe a -> [] a
alpha Nothing = []
alpha (Just x) = [x]

f :: Int -> String
f x = if x `mod` 2 == 0 then "even" else "odd"

