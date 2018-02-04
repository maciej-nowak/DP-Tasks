--List with the elements of the all sublist (polymorphically)
powerlist [] = [[]]
powerlist (h:t) = [h:y | y <- powerlist t] ++ powerlist t

--Is the first list sublist of the second list
sublist [] l2 = True
sublist (h:t) l2 = if (elem h l2 == True) then sublist t l2
                                           else False 

--Product of the lists
product l1 [] = []
product [] l2 = []
product (h:t) l2 = if (elem h l2 == True) then h : (product t l2)
	                                      else (product t l2)

--Foldr function
myFoldr f x [] = x
myFoldr f x (h:t) = f h (myFoldr f x t)
--Examples:
--myFoldr (-) 10 [10,20,30]
--myFoldr (/) 10 [10,20,30]
--myFoldr (mod) 100 [1,2,5]

--Foldr function
myFoldl f x [] = x
myFoldl f x (h:t) = myFoldl f (f x h) t
--Examples:
--myFoldl (+) 10 [10,20,30]
--myFoldl (\x y -> (x + y)*10) 100 [1,2,5]
--myFoldl (*) 10 [10,20,30]

--Examples of function using lambda
enlarge = \a b -> (a+b)*10
--enlarge 2 3
multiply = \a b -> a*b
--multiply 10 2
divide = \a b -> a/b
--divide 20 5
rest = \a b -> a mod b
--rest 20 8
connect = \a b -> a ++ b
--connect "aaa" "bbb"
universal f = \a b -> f a b
--universal (+) 5 6