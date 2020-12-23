data Const c a = Const c

unCont :: Const c a -> c
unConst (Const x) = x

lenfth :: [a] -> Const Int a
length [] = 0
length (x:xs) = Const (1 + unConst (length xs))

newtype Reader e a = Reader (e -> a)
instance Functor (Reader e) where
    fmap f (Reader g) = Reader (\x -> f (g x))

alpha :: Reader () a -> Maybe a
dumb (Reader _) = Nothing
obvious (Reader g) = Just (g ())

predToStr (Op f) = Op(\x -> if f x then "T" else "F")
newtype Op r a = Op (a->r)
instance Contravariant (Op r) where
    contramap f (Op g) = Op (g . f)
    contramap f . predToStr = predToStr . contramap f

