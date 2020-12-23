import Data.Bifunctor
data Pair a b = Pair a b deriving Show
instance Bifunctor Pair where
    bimap f g (Pair a b) = Pair (f a) (g b)

f :: Int -> Int
f x = x*x

g :: String -> String
g x = x++x