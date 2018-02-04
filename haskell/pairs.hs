import Data.Char
import Data.List

--Is the list empty
isempty :: Eq a => [a] -> Bool
isempty x = (x == [])

--Convert strings into integers
naInt :: String -> Int 
naInt = foldl(\x acc -> (digitToInt acc) + x * 10) 0

--Pairs of the element and counter of this element
listPairs [] = []
listPairs (h:t) = [(h, length [x | x <-(h:t), x == h ])] ++ listPairs [y | y <- t, y /= h ]

--Sort pairs ascending from (0,0) point
pom [] =[]
pom ((x, y) : t) = [(x^2 + y^2, x, y)] ++ (pom t)
pom2[] = []
pom2 ((x, y, z) : t) = [(y, z)] ++ (pom2 t)
f x = pom2 (sort (pom x))


