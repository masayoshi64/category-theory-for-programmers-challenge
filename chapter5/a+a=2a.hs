data Sum a = MyLeft a | MyRight a deriving Eq
data Record a = Record { flag :: Bool, value :: a}

sumToRecord :: Sum a -> Record a
sumToRecord (MyLeft x) = Record True x
sumToRecord (MyRight x) = Record False x

recordToSum :: Record a -> Sum a
recordToSum (Record b v) | b = MyLeft v
                         | otherwise = MyRight v

-- x = MyLeft 10
-- y = sumToRecord x
-- z = recordToSum y
-- x==z