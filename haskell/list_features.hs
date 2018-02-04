--One before last element of the list
prelast :: [a] -> a
prelast [] = error "the list can not be empty"
prelast (head:[]) = error "the list should have more than 1 element"
prelast l = last (init l)

--The sceond element of the list
second :: [a] -> a
second [] = error "the list can not be empty"
second (head:[]) = error "the list should have more than 1 element"
second l = head (tail l)

--The third element of the list
third :: [a] -> a
third [] = error "the list can not be empty"
third (first:second:some_list) | length some_list == 0 = error "the list should have more than 2 elements"
		     	  | otherwise = head some_list

--Reverse order of the list
cover :: [a] -> [a]
cover [] = []
cover (first:some_list) = (cover some_list) ++ [first]

--Replace first with the last element of the list
firstlast :: [a] -> [a]
firstlast [] = []
firstlast (first:some_list) = [last some_list] ++ init some_list ++ [first]

--Count positive even numbers in the list
counteven :: Integral a => [a] -> a
counteven [] = 0
counteven (first:some_list) = if mod first 2 == 0 then 1 + counteven some_list
                                                  else counteven some_list

--Count divisible by 3 numbers in the list
countdiv3 :: (Int) -> Int
countdiv3(n) = if n<2 then 0
                      else div n 3 

--Sum of numbers divisble by 3
sumdiv3 :: (Int) -> Int
sumdiv3(n) = if n<2 then 0
	                else if mod n 3 == 0 then n + sumdiv3(n-1)
	                	                 else sumdiv3(n-1)

--Has list even or odd length
evenlength :: [a] -> [Char]
evenlength some_list = if mod (length some_list) 2 == 0 then "even"
	                                                     else "odd"

--Elements in the list to power using map
powlist :: Num a => [a] -> [a]
powlist some_list = map (^2) some_list

--Elements in the list to power without using map
powlist2 :: Num a => [a] -> [a]
powlist2 [] = []
powlist2 (first:some_list) = [(first*first)] ++ (powlist2 some_list)

--Count how many times object occurs in the list (polymorphically)
countobject element some_list = length(filter (==eleme (nt) some_list)

--Copy objects n times (polymorphically)
multiword n element = [element | a<-[1,2..n]]

--Is list a plaindrome (polymorphically)
palindrome some_list = if some_list == (reverse some_list) then True
	                                                       else False

--Delete the first occurs of the element (polymorphically)
delelement element (first:some_list) = if element == first then some_list
                                                           else first : delelement element some_list

--Delete element in the n place at the list (polymorphically)
deln n some_list = take (n-1) some_list ++ drop n some_list

--Power function
power a n = powerPOM a n 1
powerPOM a n x = if n==0 then x
                         else powerPOM a (n-1) (x*a) 

--Check is the first list included in the second list
checklist [] second = True
checklist (h1:t1) second = if elem h1 second == True then checklist t1 second
                                                     else False 

--Replace elements in tuple
changePOM (a,b) = (b,a)
changeelements (first:some_list) = changePOM first : changeelements some_list
changeelements [] = []










